import { router } from '@kit.ArkUI';

@Entry
@Component
export struct SearchPage {
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

        Button() {
          Image($rawfile('header/mic.svg')).height(30)
        }
        .margin({ left: 7 })
        .backgroundColor(Color.Transparent)

      }
      .margin({ top: 37, left: 15, right: 15 })
    }
    .backgroundColor('#030303')
    .height('100%')
    .width('100%')
  }
}
