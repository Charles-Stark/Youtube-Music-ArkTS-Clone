import { router } from '@kit.ArkUI'
import { SongProps } from '../models/song'

@Entry
@Component
struct CurrentPlaying {
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

  onPageShow(): void {
    const jsonSong = JSON.stringify(this.song)
    if (this.history.has(jsonSong)) {
      this.history.delete(jsonSong)
    }
    this.history.add(jsonSong)
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
