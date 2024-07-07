@Component
export struct hotMusician {
  private image: null | Resource | string = null
  private name: null | string = null
  private rank: null | number = null
  private views: null | number = null

  build() {
    if (this.name) {
      Row() {
        Text(this.rank?.toString())
          .fontSize(25)
          .fontColor('#dddbdc')
          .margin({ bottom: 5 })
          .width('15%')
          .fontWeight(FontWeight.Bold)
        Image(this.image)
          .width(70)
          .borderRadius(35)
          .margin({ bottom: 7 })
          .margin({ right: 5 })
        Column() {
          Text(this.name)
            .fontSize(18)
            .fontColor('#fff')
            .fontWeight(FontWeight.Bold)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
            .alignSelf(ItemAlign.Start)
            .margin({ bottom: 5 })
          Text(`${this.views}` + '万订阅者')
            .fontColor('#5d5d5d')
            .fontWeight(FontWeight.Bold)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
            .maxLines(1)
            .alignSelf(ItemAlign.Start)
        }
        .layoutWeight(1)
        .padding(15)

        Image($rawfile('playing/play.svg')).height(30)
      }
    }
  }
}
