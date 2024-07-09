import { curves, router } from '@kit.ArkUI'
import { Profile } from '../Profile'
import { hotVideo } from '../../component/Video'
import { hotMusician } from '../../component/Musician'
import { hotVideoData, HotVideoProps } from '../../models/album'
import { hotMusicianData, HotMusicianProps } from '../../models/song'

@Entry
@Component
export struct RankList {
  @State isProfilePresent: boolean = false

  @Builder
  ProfileBuilder() {
    Profile({ isProfilePresent: this.isProfilePresent })
      .transition(TransitionEffect.translate({ y: 1000 })).animation({ curve: curves.springMotion(0.6, 0.8) })
  }

  @Builder
  videoBuilder() {
    Row() {
      ForEach(hotVideoData, (data: HotVideoProps) => {
        hotVideo(data)
      }, (data: HotVideoProps) => data.name)
      hotVideo().layoutWeight(1)
    }
    .alignItems(VerticalAlign.Top)
  }

  @Builder
  musicianBuilder() {
    Column() {
      ForEach(hotMusicianData, (data: HotMusicianProps) => {
        hotMusician(data)
      }, (data: HotMusicianProps) => data.name)
    }
  }

  build() {
    Scroll() {
      Column() {
        Row() {
          Image($rawfile('header/back.svg')).height(30)
            .onClick(() => {
              router.back()
            })

          Row() {
          }
          .layoutWeight(1)

          Button() {
            Image($rawfile('header/search.svg')).height(30)
          }
          .margin({ left: 7 })
          .backgroundColor(Color.Transparent)
          .onClick(() => router.pushUrl({ url: 'pages/SearchPage' }))

          Button() {
            Image($rawfile('header/profile.svg')).height(30)
          }
          .margin({ left: 7 })
          .backgroundColor(Color.Transparent)
          .bindContentCover(this.isProfilePresent, this.ProfileBuilder(), {
            modalTransition: ModalTransition.DEFAULT,
            onDisappear: () => this.isProfilePresent = false
          })
          .onClick(() => this.isProfilePresent = true)

        }
        .margin({ top: 38, left: 15, right: 15 })

        Row() {
          Text('排行榜')
            .fontColor('#f6f6f6')
            .fontSize(40)
            .fontWeight(500)
            .alignSelf(ItemAlign.End)
            .padding(20)
        } //rankList
        .width('100%')

        Row() {
          Button() {
            Row() {
              Text('全球').width('60%').fontColor('#f6f6f6').textAlign(TextAlign.Start)
              Image($rawfile('rankList/down.png')).height(30)
            }
          }
          .margin({ left: 20 })
          .backgroundColor('#1c1c1c')
          .border({ width: 1, color: '#2a2a2a' })
          .height(40)
          .width(180)
          .alignSelf(ItemAlign.Start)
        } //earth
        .width('100%')
        .margin({ bottom: 30 })

        Row() {
          Text('热门音乐视频')
            .fontSize(25)
            .fontWeight(500)
            .fontColor('#f6f6f6')
            .margin({ left: 20 })
          Text('').layoutWeight(1)
          Button() {
            Text('更多').fontColor('#f6f6f6').textAlign(TextAlign.End).fontSize(12)
          }
          .margin({ left: 20 })
          .backgroundColor('#1c1c1c')
          .border({ width: 1, color: '#2a2a2a' })
          .width(40)
          .height(25)
          .alignSelf(ItemAlign.End)
          .margin({ right: 20 })
        } //hotVideoTitle
        .width('100%')
        .margin({ bottom: 15 })

        Row() {
          Text('').width(20)
          List() {
            ListItem() {
              this.videoBuilder()
            }
          }.listDirection(Axis.Horizontal)
        }
        .height(200)

        Row() {
          Text('最爱的音乐人')
            .fontSize(23)
            .fontWeight(600)
            .fontColor(Color.White)
            .margin({ left: 20 })
        }
        .margin({ top: 10 })
        .width('100%')


        List() {
          ListItem() {
            this.musicianBuilder()
          }
        }
        .padding(20)

      }
      .backgroundColor('#030303')
      .width('100%')
    }
  }
}
