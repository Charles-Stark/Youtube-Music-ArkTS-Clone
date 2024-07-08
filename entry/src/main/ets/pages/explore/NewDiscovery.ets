import { Card } from '../../component/Card';
// import { OtherAlbum } from '../../component/OtherAlbum';
import { router } from '@kit.ArkUI';
import { Album } from '../../component/Album';
import { albumListForNewDiscovery, AlbumProps } from '../../models/album';

@Entry
@Component
struct NewDiscovery {
  @Builder
  AlbumBuilder() {
    Row() {
      ForEach(albumListForNewDiscovery.slice(0, 2), (album: AlbumProps) => {
        Album({ name: album.name, image: album.image, creator: album.creator })
      }, (album: AlbumProps) => album.name)
    }
    // .alignItems(VerticalAlign.Top)
    // .justifyContent(FlexAlign.SpaceBetween)
    .width('100%')
  }

  @Builder
  MoreBuilder() {
    Grid() {
      ForEach(albumListForNewDiscovery, (album: AlbumProps) => {
        GridItem() {
          Album({ name: album.name, image: album.image, creator: album.creator })
        }
      }, (album: AlbumProps) => album.name)
    }
    .rowsTemplate('1fr 1fr')
    // .columnsGap(10)
    // .rowsGap(5)
    // .width('100%')
    .height(350).scrollBar(BarState.Off)
  }

  build() {
    Scroll() {
      Column() {
        Row() {
          Button() {
            Image($rawfile('header/back.svg')).height(25)
          }
          .backgroundColor(Color.Transparent)
          .margin({ right: 5 })
          .onClick(() => router.back())

          Row().layoutWeight(1)

          Button() {
            Image($rawfile('header/search.svg')).height(30)
          }
          .margin({ left: 7 })
          .backgroundColor(Color.Transparent)
          .onClick(() => router.pushUrl({ url: 'pages/SearchPage' }))

        }
        .margin({ top: 38, left: 15, right: 15 })

        Card({ title: '新发行', content: this.AlbumBuilder })
          .width('100%')


        Card({ title: '专辑和单曲', content: this.MoreBuilder })
          .width('100%')
          .margin({ top: 10 })
      }
      .width('100%')
      .height('100%')
    }
    .scrollBar(BarState.Off)
    .backgroundColor('#030303')
  }
}
