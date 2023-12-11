@Entry
@Component
struct Index {
  @State message: string = 'Hello World'
  @State msg: string = '123'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Regular)
          .fontColor('#36D')
          .onClick(() => this.message = "hello ArkTs")
        Row() {
          Image($r('app.media.mate60'))
            .width(250)
            .height(250)
            .margin({ right: 20 })
        }
      }.width('100%')
    }

    .height('100%')
  }
}