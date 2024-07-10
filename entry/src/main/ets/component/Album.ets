import { router } from '@kit.ArkUI'
import { MediaModel } from '../models/media'


@Component
export struct Album {
  private image: null | string | Resource = null
  private name: null | string = null
  private creator: null | string = null

  build() {
    if (this.name) {
      Column() {
        Image(this.image)
          .width(120)
          .height(120)
          .borderRadius(7)
          .margin({ bottom: 7 })
        Text(this.name)
          .fontSize(17)
          .fontColor(Color.White)
          .fontWeight(FontWeight.Bold)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .maxLines(2)
          .alignSelf(ItemAlign.Start)
        Text(this.creator)
          .fontSize(14)
          .fontColor('#a9a9a9')
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .maxLines(1)
          .margin({ top: 3 })
          .alignSelf(ItemAlign.Start)
      }
      .width(120)
      .margin({ right: 15 })
      .onClick(() => {
        router.pushUrl({ url: 'pages/Playlist', params: { name: this.name, img: this.image, num: '5' } as MediaModel })
      })
    }
  }
}
