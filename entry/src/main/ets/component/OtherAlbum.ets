@Component
export struct OtherAlbum {
  private image: null | string = null
  private name: null | string = null
  private creator: null | string = null
  private sizeof: null | number = null

  build() {
    if (this.name) {
      Column() {
        Image(this.image)
          .width(this.sizeof)
          .height(this.sizeof)
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
      .width(this.sizeof)

      // .margin({ right: 15 })
    }
  }
}
