import { router } from '@kit.ArkUI';

@Entry
@Component
struct Notification {
  build() {
    Column() {
      Row() {
        Button() {
          Image($rawfile('header/back.svg')).height(25)
        }
        .backgroundColor(Color.Transparent)
        .margin({ right: 5 })
        .onClick(() => router.back({ url: 'pages/Index' }))

        Text('活动')
          .fontColor(Color.White)
          .fontSize(23)

        Row().layoutWeight(1)

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
      }
      .margin({ top: 30, left: 15, right: 15 })

      Image($rawfile('header/notification.svg'))
        .height(30)
        .margin({ top: 100, bottom: 12 })
      Text('你的音乐社区最新动态将显示\n在此处')
        .fontColor('#ffa9a9a9')
        .textAlign(TextAlign.Center)
    }
    .backgroundColor('#030303')
    .height('100%')
    .width('100%')
  }
}
