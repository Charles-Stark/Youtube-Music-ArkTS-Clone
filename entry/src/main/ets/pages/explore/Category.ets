import { router } from '@kit.ArkUI'
import { Card } from '../../component/Card'
import { TagButton } from '../../component/TagButton'

const tagList: string[] = [
  '锻炼',
  '摇滚乐',
  '激情四射的音乐',
  '轻松愉悦',
  '派对',
  '通勤',
  '悲伤',
  '放松',
  '黑人的命也是命',
  '浪漫'
]

function randomColor(): string {
  let random = Math.random()
  if (random === 0) {
    return randomColor()
  }
  return '#' + random.toString(16).substring(2, 8)
}

@Entry
@Component
struct Category {
  @Builder
  ChoiceBuilder() {
    List() {
      ForEach(tagList.slice(0, 6), (tag: string, index) => {
        ListItem() {
          TagButton({ tag: tag, color: randomColor() })
            .margin({
              right: index % 2 == 0 ? 10 : 0,
              top: 10,
              bottom: 10,
              left: index % 2 == 0 ? 0 : 10
            })
        }
      })
    }
    .lanes(2)
  }

  @Builder
  TagBuilder() {
    List() {
      ForEach(tagList, (tag: string, index) => {
        ListItem() {
          TagButton({ tag: tag, color: randomColor() })
            .margin({
              right: index % 2 == 0 ? 10 : 0,
              top: 10,
              bottom: 10,
              left: index % 2 == 0 ? 0 : 10
            })

        }

      })
    }
    .lanes(2)
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


        Text('心情与流派')
          .fontColor(Color.White)
          .fontSize(30)
          .width('100%')
          .margin({
            left: 30,
            top: 30,
          })


        Card({ title: '为你精选', content: this.ChoiceBuilder })
        Card({ title: '心情与场景', content: this.TagBuilder })
      }

    }
    .backgroundColor('#030303')
    .width('100%')
    .height('100%')

  }
}

