@Entry
@Component
struct Index {
  @State message: string = 'Hello World'
  @State msg:number = 123

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Regular)
          .fontColor('#36D')
          .onClick(()=>this.message="hello ArkTs")
      }
      .width('100%')
    }
    .height('100%')
  }
}