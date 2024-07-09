import { router } from '@kit.ArkUI';
import axios, { AxiosResponse } from '@ohos/axios';
import { SongProps } from '../models/song';

@Entry
@Component
export struct SearchPage {
  @State result: SongProps[] | null = null

  build() {
    Column() {
      Row() {
        Button() {
          Image($rawfile('header/back.svg')).height(25)
        }
        .backgroundColor(Color.Transparent)
        .margin({ right: 5 })
        .onClick(() => router.back())

        TextInput({ placeholder: '搜索歌曲、音乐人、播客' })
          .defaultFocus(true)
          .placeholderColor('#ffa9a9a9')
          .fontColor(Color.White)
          .fontSize(20)
          .backgroundColor('#ff3c3c3c')
          .layoutWeight(1)
          .onChange((keyword: string) => {
            axios.get('https://yt.c12k.dev/search', {
              params: {
                keyword: keyword
              }
            })
              .then((res: AxiosResponse) => {
                if (res.status == 200) {
                  this.result = res.data
                }
              })
          })
          .onSubmit((_enterKey: EnterKeyType, event: SubmitEvent) => {
            axios.get('https://yt.c12k.dev/search', {
              params: {
                keyword: event.text
              }
            })
              .then((res: AxiosResponse) => {
                if (res.status == 200) {
                  this.result = res.data
                }
              })
          })

        Button() {
          Image($rawfile('header/mic.svg')).height(30)
        }
        .margin({ left: 7 })
        .backgroundColor(Color.Transparent)

      }
      .margin({ top: 38, left: 15, right: 15 })

      Scroll() {
        Column() {
          ForEach(this.result, (song: SongProps) => {
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

          Column()
            .height(180)
        }
      }
      .scrollable(ScrollDirection.Vertical)
      .margin({ top: 12 })

    }
    .backgroundColor('#030303')
    .height('100%')
    .width('100%')
  }
}
