/**
 * Author:Jelly
 * Date:2023/12/8
 * Describe: Image案例
 */

@Entry
@Component
struct ImagePage {
  @State imageWidth: number = 250

  build() {
    Column() {
      Row() {
        Image($r('app.media.mate60'))
          .width(this.imageWidth)
          .interpolation(ImageInterpolation.High)
      }
      .height(350)
      .width('100%')
      .justifyContent(FlexAlign.Center)
      .alignItems(VerticalAlign.Center)


      Row() {
        Text($r('app.string.width_label'))
          .fontSize(16)
          .fontWeight(FontWeight.Bold)

        TextInput({ placeholder: '请输入图片宽度', text: String(this.imageWidth) })
          .width(150)
          .backgroundColor('#fff')
          .fontColor('red')
          .fontSize(20)
          .type(InputType.Number)
          .maxLength(3)
          .onChange((value) => {
            if (parseInt(value) < 350 && parseInt(value) > 250) {
              this.imageWidth = Number(value)
            }
          })
      }
      .width('100%')
      .margin({ top: 20 })
      .padding({ left: 14, right: 14 })
      .justifyContent(FlexAlign.SpaceBetween)
      .alignItems(VerticalAlign.Center)

      Divider()
        .width('91%')
        .backgroundColor('#eee')
        .height(2)

      Row() {
        Button('缩小')
          .width(100)
          .fontSize(20)
          .onClick(() => {
            if (this.imageWidth > 250) {
              this.imageWidth -= 10
            }
          })
        Button('放大')
          .width(100)
          .fontSize(20)
          .onClick(() => {
            if (this.imageWidth < 350) {
              this.imageWidth += 10
            }
          })
      }
      .width('100%')
      .margin({ top: 20 })
      .justifyContent(FlexAlign.SpaceAround)
      .alignItems(VerticalAlign.Center)

      Row() {
        Slider({
          min: 250,
          max: 350,
          value: 270,
          step: 10,
          style: SliderStyle.OutSet
        })
          .margin({ top: 10 })
          .trackThickness(7)
          .blockColor('#36F')
          .showTips(true)
          .showSteps(true)
          .onChange(value => {
            this.imageWidth = value
          })
      }
    }
    .margin(10)
  }
}