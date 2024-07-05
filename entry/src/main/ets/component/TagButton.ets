@Component
export struct TagButton {
  private tag: string | null = null
  private color: null | string= null

  build() {

    Button() {
      Row() {
        Text(this.tag)
          .fontColor(Color.White)
        Row().layoutWeight(1)
      }
    }
    .padding({left: 10, top: 15,bottom:15})
    .type(ButtonType.Normal)
    .backgroundColor('#292929')
    .borderWidth({ left: 5 })
    .borderColor(this.color)
    .borderRadius(3)

  }
}