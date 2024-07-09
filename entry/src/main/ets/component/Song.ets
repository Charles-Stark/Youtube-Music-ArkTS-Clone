@Component
export struct Song {
  private img: null | string | Resource = null
  private name: null | string = null
  private creator: null | string = null

  build() {
    if (this.name) {
      Row() {
        Image(this.img)
          .width(70)
          .height(70)
          .borderRadius(7)
          .margin({ right: 7 })
        Column() {
          Text(this.name)
            .fontSize(20)
            .fontColor(Color.White)
            .fontWeight(FontWeight.Bold)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
            .maxLines(2)
            .alignSelf(ItemAlign.Start)
          Text(this.creator)
            .fontSize(16)
            .fontColor('#a9a9a9')
            .textOverflow({ overflow: TextOverflow.Ellipsis })
            .maxLines(1)
            .margin({ top: 3 })
            .alignSelf(ItemAlign.Start)
        }.width(220)

        Column().layoutWeight(1)
        Image($rawfile('more.svg'))
          .height(25)
      }
      .margin({ bottom: 15 })
      .alignItems(VerticalAlign.Center)
    }
  }
}
