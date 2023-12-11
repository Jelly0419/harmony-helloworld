/**
 * Author:Jelly
 * Date:2023/12/8
 * Describe:Header组件
 */
@Component
export struct Header{
  private title:ResourceStr
  build(){
    Row() {
      Image($r("app.media.fan_hui"))
        .width(30)
      Text(this.title)
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
      Blank()
      Image($r("app.media.shua_xin"))
        .width(30)
    }
    .width('100%')
  }
}