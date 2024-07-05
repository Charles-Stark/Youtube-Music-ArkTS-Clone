@Component
export struct hotVideo {
  private image: null | Resource = null
  private name: null | string = null
  private creator: null | string = null
  private rankList: null | string = null
  private watch: null | string = null

  build() {
      if (this.name) {
        Column() {
          Image(this.image)
            .width('100%')
            .borderRadius(7)
            .margin({ bottom: 7 })
            .margin({right:20})
          Row(){
            Text(this.rankList+'  ')
              .fontSize(14)
              .fontColor(Color.White)
              .fontWeight(FontWeight.Bold)
              .textOverflow({ overflow: TextOverflow.Ellipsis })
              .alignSelf(ItemAlign.Start)
            Text(this.name)
              .fontSize(14)
              .fontColor(Color.White)
              .fontWeight(FontWeight.Bold)
              .textOverflow({ overflow: TextOverflow.Ellipsis })
              .maxLines(1)
              .alignSelf(ItemAlign.Start)
          }
          .width('100%')
          Text(this.creator+'  '+`${this.watch}`+'万次观看')
            .fontSize(14)
            .fontColor('#a9a9a9')
            .textOverflow({ overflow: TextOverflow.Ellipsis })
            .maxLines(1)
            .margin({ top: 3 })
            .alignSelf(ItemAlign.Start)
        }
        .height(130)
        .margin({ bottom: 7 })
        .width(250)
        .margin({ right: 15 })
      }

  }
}
