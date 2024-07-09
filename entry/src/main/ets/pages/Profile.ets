import { router } from '@kit.ArkUI'

@Component
export struct Profile {
  @Link isProfilePresent: boolean

  build() {
    Column() {
      Row() {
        Button() {
          Image($rawfile('header/close.svg')).height(25)
        }
        .backgroundColor(Color.Transparent)
        .margin({ right: 5 })
        .onClick(() => this.isProfilePresent = !this.isProfilePresent)

        Text('账号')
          .fontColor(Color.White)
          .fontSize(23)

        Row().layoutWeight(1)
      }
      .margin({ top: 38, left: 15, right: 15 })

      Row() {
        Image($rawfile('header/profile_pic.jpg'))
          .width(40)
          .borderRadius(90)
          .margin({ right: 15 })
        Column() {
          Text('Charles Stark')
            .fontColor(Color.White)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 7 })
          Text('charlesstark918@gmail.com')
            .fontColor('#ffa9a9a9')
            .margin({ bottom: 10 })
          Text('管理你的Google账号')
            .fontColor('#4285f4')
            .margin({ bottom: 15 })
        }
        .alignItems(HorizontalAlign.Start)

        Row().layoutWeight(1)
      }
      .alignItems(VerticalAlign.Top)
      .margin({ left: 15, right: 15, top: 30 })
      .borderWidth({ bottom: 0.3 })
      .borderColor('#ffa9a9a9')

      Row() {
        Image($rawfile('header/download.svg'))
          .width(25)
          .margin({ left: 20, right: 20 })
        Text('下载内容')
          .fontColor(Color.White)
          .fontSize(20)
        Row().layoutWeight(1)
      }
      .alignItems(VerticalAlign.Center)
      .margin({ left: 15, right: 15, top: 30, })

      Row() {
        Image($rawfile('header/history.svg'))
          .width(25)
          .margin({ left: 20, right: 20 })
        Text('观看记录')
          .fontColor(Color.White)
          .fontSize(20)
          .onClick(() => {
            this.isProfilePresent = false
            router.pushUrl({ url: 'pages/History' })
          })
        Row().layoutWeight(1)
      }
      .alignItems(VerticalAlign.Center)
      .margin({ left: 15, right: 15, top: 30, })

      Row() {
        Image($rawfile('header/recap.svg'))
          .width(25)
          .margin({ left: 20, right: 20 })
        Text('你的Recap')
          .fontColor(Color.White)
          .fontSize(20)
        Row().layoutWeight(1)
      }
      .alignItems(VerticalAlign.Center)
      .margin({ left: 15, right: 15, top: 30, })

      Row() {
        Image($rawfile('header/group.svg'))
          .width(25)
          .margin({ left: 20, right: 20 })
        Text('切换账号')
          .fontColor(Color.White)
          .fontSize(20)
        Row().layoutWeight(1)
      }
      .alignItems(VerticalAlign.Center)
      .margin({ left: 15, right: 15, top: 30, })

      Row() {
        Image($rawfile('header/setting.svg'))
          .width(25)
          .margin({ left: 20, right: 20 })
        Text('设置')
          .fontColor(Color.White)
          .fontSize(20)
        Row().layoutWeight(1)
      }
      .alignItems(VerticalAlign.Center)
      .margin({ left: 15, right: 15, top: 30, })

      Row() {
        Image($rawfile('header/help.svg'))
          .width(25)
          .margin({ left: 20, right: 20 })
        Text('帮助与反馈')
          .fontColor(Color.White)
          .fontSize(20)
        Row().layoutWeight(1)
      }
      .alignItems(VerticalAlign.Center)
      .margin({ left: 15, right: 15, top: 30, })

    }
    .backgroundColor('#030303')
    .height('100%')
    .width('100%')
  }
}
