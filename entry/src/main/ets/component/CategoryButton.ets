@Component
export struct CategoryButton {
  private content: null | string = null

  build() {
    if (this.content) {
      Button(this.content)
        .borderColor(Color.White)
        .borderWidth(1)
        .backgroundColor(Color.Transparent)
    }
  }
}
