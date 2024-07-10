import { MediaModel } from '../models/media'
import { router } from '@kit.ArkUI'
import { SongProps } from '../models/song'
import axios, { AxiosResponse } from '@ohos/axios'

@Entry
@Component
struct Playlist {
  playlist: MediaModel = router.getParams() as MediaModel
  @State songs: SongProps[] | null = null

  aboutToAppear(): void {
    axios.get('https://yt.c12k.dev/randomSongs', {
      params: {
        count: this.playlist.num.slice(0, this.playlist.num.indexOf('首'))
      }
    })
      .then((res: AxiosResponse) => {
        if (res.status == 200) {
          this.songs = res.data
        }
      })
  }

  build() {
    Column() {
      Row() {
        Button() {
          Image($rawfile('header/back.svg')).height(25)
        }
        .backgroundColor(Color.Transparent)
        .margin({ right: 5 })
        .onClick(() => router.back())

        Text('播放列表')
          .fontColor(Color.White)
          .fontSize(22)
          .margin({ left: 5 })

        Row() {
        }
        .layoutWeight(1)
      }
      .margin({ top: 38, left: 15, right: 15 })

      if (this.playlist) {
        Scroll() {
          Column() {
            Image(this.playlist.img)
              .height(270)
              .width(270)
              .borderRadius(15)

            Scroll() {
              Text(this.playlist.name)
                .fontColor(Color.White)
                .fontSize(25)
                .fontWeight(FontWeight.Bold)
            }
            .scrollable(ScrollDirection.Horizontal)
            .scrollBar(BarState.Off)
            .margin({
              left: 20,
              right: 20,
              top: 25,
              bottom: 15
            })
            .alignSelf(ItemAlign.Center)

            if (this.songs) {
              ForEach(this.songs, (song: SongProps) => {
                Row() {
                  Image(song.img)
                    .width(80)
                    .height(80)
                    .borderRadius(3)
                    .margin({ right: 15 })
                  Column() {
                    Text(song.name)
                      .fontSize(16)
                      .fontWeight(700)
                      .fontColor('#fff')
                      .textOverflow({ overflow: TextOverflow.Ellipsis })
                      .maxLines(1)
                    Text(`${song.creator}・${Math.floor(song.time / 60).toString().padStart(2, '0')}:${(song.time %
                      60).toString().padStart(2, '0')}`)
                      .fontSize(14)
                      .fontColor('#cdcdcd')
                      .textOverflow({ overflow: TextOverflow.Ellipsis })
                      .maxLines(1)
                      .margin({ top: 7 })
                  }
                  .layoutWeight(1)
                  .alignItems(HorizontalAlign.Start)

                  Row() {
                    Image($rawfile('more.svg')).width(20)
                  }
                }
                .alignItems(VerticalAlign.Center)
                .margin({ top: 12, left: 15, right: 15 })
                .onClick(() => {
                  router.pushUrl({ url: 'pages/CurrentPlaying', params: song })
                })
              })
            } else {
              Text('播放列表为空')
                .fontColor(Color.White)
                .margin({ top: 50 })
                .fontSize(18)
            }
          }
        }
        .margin({ top: 30, bottom: 100 })
      }
    }
    .backgroundColor('#030303')
    .height('100%')
    .width('100%')
  }
}
