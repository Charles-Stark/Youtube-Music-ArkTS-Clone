import { router } from '@kit.ArkUI'

@Entry
@Component
struct History {
  @StorageLink('history') history: Set<string> = new Set<string>()

  build() {
    Column() {
      Row() {
        Button() {
          Image($rawfile('header/back.svg')).height(25)
        }
        .backgroundColor(Color.Transparent)
        .margin({ right: 5 })
        .onClick(() => router.back())

        Text('历史记录')
          .fontColor(Color.White)
          .fontSize(22)
          .margin({ left: 5 })

        Row() {
        }
        .layoutWeight(1)

        Button() {
          Image($rawfile('header/search.svg')).height(30)
        }
        .margin({ left: 7 })
        .backgroundColor(Color.Transparent)
        .onClick(() => router.pushUrl({ url: 'pages/SearchPage' }))
      }
      .margin({ top: 38, left: 15, right: 15 })

      if (this.history.size > 0) {
        Scroll() {
          Column() {
            ForEach(Array.from(this.history).reverse(), (item: string) => {
              Row() {
                Image(JSON.parse(item).img)
                  .width(80)
                  .height(80)
                  .borderRadius(3)
                  .margin({ right: 15 })
                Column() {
                  Text(JSON.parse(item).name)
                    .fontSize(16)
                    .fontWeight(700)
                    .fontColor('#fff')
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                    .maxLines(1)
                  Text(JSON.parse(item).creator)
                    .fontSize(14)
                    .fontColor('#cdcdcd')
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                    .maxLines(1)
                    .margin({ top: 7 })
                }
                .layoutWeight(1)
                .alignItems(HorizontalAlign.Start)

                Image($rawfile('header/close.svg'))
                  .width(20)
                  .onClick(() => {
                    this.history.delete(item)
                  })
              }
              .alignItems(VerticalAlign.Center)
              .margin({ top: 12, left: 15, right: 15 })
              .onClick(() => router.pushUrl({ url: 'pages/CurrentPlaying', params: JSON.parse(item) }))
            })
          }
        }
        .margin({ top: 15 })
      } else {
        Image($rawfile('header/history.svg'))
          .height(50)
          .margin({ top: 200, bottom: 20 })
        Text('暂无历史记录')
          .fontColor(Color.White)
          .fontSize(18)
      }
    }
    .backgroundColor('#030303')
    .height('100%')
    .width('100%')
  }
}
