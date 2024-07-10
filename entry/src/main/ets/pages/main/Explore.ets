import { curves, router } from '@kit.ArkUI'
import { Profile } from '../Profile'
import { Card } from '../../component/Card';
import { Album } from '../../component/Album';
import { TagButton } from '../../component/TagButton';
import { albumListForNewDiscovery, AlbumProps } from '../../models/album';

interface MoodInterface {
  mood: string,
  color: string
}

const moodData: MoodInterface[] = [
  { mood: '锻炼', color: '#23b0c7' },
  { mood: '轻松', color: '#b0e1a7' },
  { mood: '摇滚', color: '#fff' },
  { mood: '悲伤', color: '#ff0d4751' },
  { mood: '通勤', color: '#ff2fe30e' },
  { mood: '派对', color: '#fff5a1a1' },
]

@Extend(Column)
function myStyle() {
  .justifyContent(FlexAlign.Center)
  .alignItems(HorizontalAlign.Start)
  .width(100)
  .height(75)
  .backgroundColor('#292527')
  .borderRadius(8)
}

@Extend(Text)
function myTextStyle() {
  .fontSize(17)
  .fontWeight(500)
  .fontColor('#fff')
  .padding({ left: 7, top: 9 })
}

@Entry
@Component
export struct Explore {
  @State isProfilePresent: boolean = false

  @Builder
  AlbumBuilder() {
    Scroll() {
      Row() {
        ForEach(albumListForNewDiscovery.slice(6, 9), (album: AlbumProps) => {
          Album({ name: album.name, image: album.image, creator: album.creator })
        }, (album: AlbumProps) => album.name)
      }
      .alignItems(VerticalAlign.Top)
    }
    .scrollable(ScrollDirection.Horizontal)
    .scrollBar(BarState.Off)
  }

  @Builder
  MoodBuilder() {
    List() {
      ForEach(moodData, (item: MoodInterface) => {
        ListItem() {
          if (item.mood) {
            TagButton({ tag: item.mood, color: item.color })
              .height(65)
              .width(150)
              .margin({ right: 10 })
            // Row() {
            //   Column() {
            //   }
            //   .borderRadius({ topLeft: 8, bottomLeft: 8 })
            //   .height('100%')
            //   .width(8)
            //   .backgroundColor(`${item.color}`)
            //
            //   Column() {
            //     Text(`${item.mood}`)
            //       .fontSize(20)
            //       .fontColor('#fff')
            //   }
            //   .borderRadius({ topRight: 8, bottomRight: 8 })
            //   .justifyContent(FlexAlign.Center)
            //   .height('100%')
            //   .backgroundColor('#292527')
            //   .layoutWeight(1)
            // }
            // .padding(8)
            // .height(65)
            // .width(155)
          }
        }
      }, (item: MoodInterface) => item.mood)
    }
    .listDirection(Axis.Horizontal)
    .lanes(2)
    .height(125)
    .scrollBar(BarState.Off)
  }

  @Builder
  ProfileBuilder() {
    Profile({ isProfilePresent: this.isProfilePresent })
      .transition(TransitionEffect.translate({ y: 1000 })).animation({ curve: curves.springMotion(0.6, 0.8) })
  }

  build() {
    Column() {
      /*
      *TOP 顶部栏
       */
      Row() {
        Image($rawfile('header/logo_full.png')).height(30)

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

      /*
      *第二行的三个方块
       */
      Column() {
        Grid() {
          GridItem() {
            Column() {
              Image($rawfile('explore/music-icon.png'))
                .width(31)
                .padding({ left: 9, top: 6 })
              Text('新发行')
                .myTextStyle()
            }
            .onClick(() => {
              router.pushUrl({
                url: 'pages/explore/NewDiscovery'
              }
              )
            })
            .myStyle()
          }

          GridItem() {
            Column() {
              Image($rawfile('explore/thecharts.png')).width(25)
                .width(31)
                .padding({ left: 9, top: 6 })
              Text('排行榜')
                .myTextStyle()
            }
            .myStyle()
          }.onClick(() => {
            router.pushUrl({
              url: 'pages/explore/RankList'
            })
          })

          GridItem() {
            Column() {
              Image($rawfile('explore/smile.png')).width(25)
                .width(31)
                .padding({ left: 9, top: 6 })
              Text('心情与流派')
                .myTextStyle()
            }
            .myStyle()
          }
          .onClick(() => {
            router.pushUrl({ url: 'pages/explore/Category' })
          })
        }
        .height(100)
        .columnsTemplate('1fr 1fr 1fr')
        .rowsGap(10)
        .columnsGap(10)
        .padding(10)
      }
      .height(140)
      .width('100%')
      .justifyContent(FlexAlign.Center)

      /*
      *新专辑与单曲
       */

      Card({ title: '新专辑与单曲', content: this.AlbumBuilder })
      /*
      *心情与流派
       */
      Card({ title: '心情与流派', content: this.MoodBuilder })
    }
    .backgroundColor('#030303')
    .height('100%')
    .width('100%')
  }
}
