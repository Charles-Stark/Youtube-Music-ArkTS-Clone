@Component
export struct Card {
  private title: null | string = null
  @BuilderParam private content: () => void = EmptyBuilderFunction

  build() {
    if (this.title) {
      Column() {
        Row() {
          Text(this.title)
            .fontSize(25)
            .fontColor('#ffffff')
            .layoutWeight(1)
            .margin({ bottom: 12 })
        }

        this.content()
      }
      .margin({
        left: 15,
        right: 15,
        top: 30,
      })
    }
  }
}

@Builder function EmptyBuilderFunction(): void {}
