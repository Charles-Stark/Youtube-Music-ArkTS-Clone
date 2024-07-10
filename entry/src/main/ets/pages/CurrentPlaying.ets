import { router } from '@kit.ArkUI'
import { SongProps } from '../models/song'
import { media } from '@kit.MediaKit'
import { BusinessError } from '@kit.BasicServicesKit'
import { common } from '@kit.AbilityKit'

@Entry
@Component
struct CurrentPlaying {
  @State avplayer: media.AVPlayer | null = null
  private count: number = 0;
  private isSeek: boolean = true; // 用于区分模式是否支持seek操作
  private fileSize: number = -1;
  private fd: number = 0;

  setAVPlayerCallback(avPlayer: media.AVPlayer) {
    // seek操作结果回调函数
    avPlayer.on('seekDone', (seekDoneTime: number) => {
      console.info(`AVPlayer seek succeeded, seek time is ${seekDoneTime}`);
    })
    // error回调监听函数,当avPlayer在操作过程中出现错误时调用 reset接口触发重置流程
    avPlayer.on('error', (err: BusinessError) => {
      console.error(`Invoke avPlayer failed, code is ${err.code}, message is ${err.message}`);
      avPlayer.reset(); // 调用reset重置资源，触发idle状态
    })
    // 状态机变化回调函数
    avPlayer.on('stateChange', async (state: string, reason: media.StateChangeReason) => {
      switch (state) {
        case 'idle': // 成功调用reset接口后触发该状态机上报
          console.info('AVPlayer state idle called.');
          avPlayer.release(); // 调用release接口销毁实例对象
          break;
        case 'initialized': // avplayer 设置播放源后触发该状态上报
          console.info('AVPlayer state initialized called.');
          avPlayer.prepare();
          break;
        case 'prepared': // prepare调用成功后上报该状态机
          console.info('AVPlayer state prepared called.');
          avPlayer.play(); // 调用播放接口开始播放
          break;
        case 'playing': // play成功调用后触发该状态机上报
          console.info('AVPlayer state playing called.');
          if (this.count !== 0) {
            if (this.isSeek) {
              console.info('AVPlayer start to seek.');
              avPlayer.seek(avPlayer.duration); //seek到音频末尾
            } else {
              // 当播放模式不支持seek操作时继续播放到结尾
              console.info('AVPlayer wait to play end.');
            }
          } else {
            avPlayer.pause(); // 调用暂停接口暂停播放
          }
          this.count++;
          break;
        case 'paused': // pause成功调用后触发该状态机上报
          console.info('AVPlayer state paused called.');
          avPlayer.play(); // 再次播放接口开始播放
          break;
        case 'completed': // 播放结束后触发该状态机上报
          console.info('AVPlayer state completed called.');
          avPlayer.stop(); //调用播放结束接口
          break;
        case 'stopped': // stop接口成功调用后触发该状态机上报
          console.info('AVPlayer state stopped called.');
          avPlayer.reset(); // 调用reset接口初始化avplayer状态
          break;
        case 'released':
          console.info('AVPlayer state released called.');
          break;
        default:
          console.info('AVPlayer state unknown called.');
          break;
      }
    })
  }

  song: SongProps = router.getParams() as SongProps
  @StorageLink('history') history: Set<string> = new Set<string>()
  @State isPlaying: boolean = true
  @State totalTime: number = this.song.time
  @State timeRemain: number = this.song.time
  @State intervalId: number = setInterval(() => {
    this.timeRemain -= 1
    if (this.timeRemain <= 0) {
      clearInterval(this.intervalId)
      this.isPlaying = false
      this.timeRemain = this.totalTime
    }
  }, 1000)
  onPlayingChange = () => {
    this.isPlaying = !this.isPlaying
    if (this.isPlaying) {
      this.intervalId = setInterval(() => {
        this.timeRemain -= 1
        if (this.timeRemain <= 0) {
          clearInterval(this.intervalId)
          this.isPlaying = false
          this.timeRemain = this.totalTime
        }
      }, 1000)
    } else {
      clearInterval(this.intervalId)
    }
  }

  async onPageShow(): Promise<void> {
    const jsonSong = JSON.stringify(this.song)
    if (this.history.has(jsonSong)) {
      this.history.delete(jsonSong)
    }
    this.history.add(jsonSong)

    this.avplayer = await media.createAVPlayer()
    this.setAVPlayerCallback(this.avplayer)

    let context = getContext(this) as common.UIAbilityContext
    let fileDescriptor = await context.resourceManager.getRawFd('audio/sample.mp3')
    let avFileDescriptor: media.AVFileDescriptor = {
      fd: fileDescriptor.fd,
      offset: fileDescriptor.offset,
      length: fileDescriptor.length
    }
    this.isSeek = true
    this.avplayer.fdSrc = avFileDescriptor

    this.avplayer.prepare()
    this.avplayer.play()
  }

  build() {
    Column() {
      if (this.song) {
        Row() {
          Button() {
            Image($rawfile('header/down_arrow.svg')).height(30)
          }
          .backgroundColor(Color.Transparent)
          .onClick(() => router.back())

          Row().layoutWeight(1)

          Button() {
            Image($rawfile('header/cast.svg')).height(30)
          }
          .backgroundColor(Color.Transparent)

          Button() {
            Image($rawfile('more.svg')).height(30)
          }
          .margin({ left: 7 })
          .backgroundColor(Color.Transparent)
        }
        .margin({ top: 38, left: 15, right: 15 })

        Image(this.song.img)
          .height(325)
          .width(325)
          .borderRadius(15)
          .margin({ top: 35 })

        Scroll() {
          Text(this.song.name)
            .fontColor(Color.White)
            .fontWeight(FontWeight.Bold)
            .fontSize(30)
        }
        .scrollable(ScrollDirection.Horizontal)
        .scrollBar(BarState.Off)
        .margin({ left: 32, right: 32, top: 25 })
        .alignSelf(ItemAlign.Start)

        Text(this.song.creator)
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .fontColor('#a9a9a9')
          .fontSize(20)
          .margin({ left: 32, right: 32, top: 10 })
          .alignSelf(ItemAlign.Start)

        Scroll() {
          Row() {
            Button() {
              LikeButtonContent()
            }.backgroundColor('#212121')

            Button() {
              CommentButtonContent()
            }.backgroundColor('#212121')
            .margin({ left: 10 })

            Button() {
              SaveButtonContent()
            }.backgroundColor('#212121')
            .margin({ left: 10 })

            Button() {
              ShareButtonContent()
            }.backgroundColor('#212121')
            .margin({ left: 10 })
          }
        }
        .margin({ left: 30, right: 30, top: 22 })
        .scrollable(ScrollDirection.Horizontal)
        .scrollBar(BarState.Off)

        Slider({ max: this.totalTime, value: this.totalTime - this.timeRemain })
          .blockColor(Color.White)
          .trackColor('#212121')
          .selectedColor(Color.White)
          .margin({ left: 30, right: 30, top: 21 })
          .onChange((value) => {
            this.timeRemain = this.totalTime - value
          })

        Row() {
          Image($rawfile('playing/shuffle.svg'))
            .width(40)
            .margin({ right: 12 })

          Image($rawfile('playing/skip_prev.svg'))
            .width(40)
            .margin({ right: 12 })

          Image(this.isPlaying ? $rawfile('playing/pause.svg') : $rawfile('playing/play.svg'))
            .width(80)
            .margin({ right: 12 })
            .onClick(this.onPlayingChange)

          Image($rawfile('playing/skip_next.svg'))
            .width(40)
            .margin({ right: 12 })

          Image($rawfile('playing/repeat.svg'))
            .width(40)
        }
        .margin({ top: 10 })

        Flex({ justifyContent: FlexAlign.SpaceEvenly }) {
          Text('播放列表')
            .fontColor('#a9a9a9')
            .fontSize(18)
          Text('歌词')
            .fontColor('#a9a9a9')
            .fontSize(18)
          Text('相关内容')
            .fontColor('#a9a9a9')
            .fontSize(18)
        }
        .margin({ top: 33 })
      }
    }
    .backgroundColor('#030303')
    .height('100%')
    .width('100%')
  }
}

@Component
struct LikeButtonContent {
  build() {
    Row() {
      Image($rawfile('playing/thumb_up.svg'))
        .height(30)
        .margin({ right: 7 })
      Text('23万')
        .fontColor(Color.White)
        .fontSize(18)
        .margin({ right: 7 })
        .padding({ right: 7 })
        .borderWidth({ right: 1 })
        .borderColor('#a9a9a9')
      Image($rawfile('playing/thumb_down.svg'))
        .height(30)
    }
    .padding({
      left: 15,
      right: 15,
      top: 5,
      bottom: 5,
    })
    .alignItems(VerticalAlign.Center)
  }
}

@Component
struct CommentButtonContent {
  build() {
    Row() {
      Image($rawfile('playing/comment.svg'))
        .height(30)
        .margin({ right: 7 })
      Text('121')
        .fontColor(Color.White)
        .fontSize(18)
    }
    .padding({
      left: 15,
      right: 15,
      top: 5,
      bottom: 5,
    })
    .alignItems(VerticalAlign.Center)
  }
}

@Component
struct SaveButtonContent {
  build() {
    Row() {
      Image($rawfile('playing/playlist_add.svg'))
        .height(30)
        .margin({ right: 7 })
      Text('保存')
        .fontColor(Color.White)
        .fontSize(18)
    }
    .padding({
      left: 15,
      right: 15,
      top: 5,
      bottom: 5,
    })
    .alignItems(VerticalAlign.Center)
  }
}

@Component
struct ShareButtonContent {
  build() {
    Row() {
      Image($rawfile('playing/share.svg'))
        .height(30)
        .margin({ right: 7 })
      Text('分享')
        .fontColor(Color.White)
        .fontSize(18)
    }
    .padding({
      left: 15,
      right: 15,
      top: 5,
      bottom: 5,
    })
    .alignItems(VerticalAlign.Center)
  }
}
