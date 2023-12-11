/**
 * Author:Jelly
 * Date:2023/12/8
 * Describe: list案例
 */
class Item {
  name: string
  image: ResourceStr
  price: number
  discount?: number

  constructor(name: string, image: ResourceStr, price: number, discount?: number) {
    this.name = name
    this.image = image
    this.price = price
    this.discount = discount
  }
}

import { Header } from '../components/Header'

//  全局自定义构建函数
// @Builder function ItemCard(item){
//   Row({ space: 10 }) {
//     Image(item.image)
//       .width(100)
//     Column({ space: 4 }) {
//       Text(item.name)
//         .fontSize(20)
//         .fontWeight(FontWeight.Bold)
//
//       if (item.discount) {
//         Text(`原价¥ ${item.price}`)
//           .fontColor('#ccc')
//           .fontSize(18)
//           .decoration({ type: TextDecorationType.LineThrough })
//         Text(`折扣价¥ ${item.discount}`)
//           .fontColor('#f36')
//           .fontSize(18)
//         Text(`补贴¥ ${item.price - item.discount}`)
//           .fontColor('#f36')
//           .fontSize(18)
//       } else {
//         Text(`¥ ${item.price}`)
//           .fontColor('#f36')
//           .fontSize(18)
//       }
//     }
//     .alignItems(HorizontalAlign.Start)
//   }
//   .alignItems(VerticalAlign.Top)
//   .backgroundColor('#fff')
//   .padding(20)
//   .borderRadius(20)
//   .width('94%')
//   .margin({ top: 10 })
// }

// 全局公共样式
// @Styles function fillScreen(){
//   .padding(20)
//   .height('100%')
//   .width('100%')
//   .backgroundColor('#f5f5f5')
// }

// 无法写入局部
@Extend(Text) function priceText(){
  .fontColor('#f36')
  .fontSize(18)
}
@Entry
@Component
struct ItemPage {
  @State ListEndFlag: boolean = false
  // 商品数据
  private items: Array<Item> = [
    new Item('华为Mate60', $r('app.media.mate60'), 6999, 6499),
    new Item('MateBookProX', $r('app.media.mate60'), 13999),
    new Item('WatchGT4', $r('app.media.mate60'), 1438),
    new Item('FreeBuds Pro3', $r('app.media.mate60'), 1499),
    new Item('FreeBuds Pro3', $r('app.media.mate60'), 1499),
    new Item('FreeBuds Pro3', $r('app.media.mate60'), 1499),
    new Item('FreeBuds Pro3', $r('app.media.mate60'), 1499),
    new Item('FreeBuds Pro3', $r('app.media.mate60'), 1499),
    new Item('Mate X5', $r('app.media.mate60'), 12999)
  ]

  build() {
    Column({ space: 8 }) {
      Header({ title: '商品列表' })

      List({ space: 10 }) {
        ForEach(
          this.items,
          (item: Item) => {
            ListItem() {
              this.ItemCard(item)
            }
          })
      }
      .width('100%')
      .layoutWeight(1)
      .onReachEnd(() => {
        this.ListEndFlag = true
        setTimeout(() => {
          this.ListEndFlag = false
        }, 3000)
      })

      if (this.ListEndFlag) {
        Text('加载中...')
          .backgroundColor('#fff')
      }
    }
    .fillScreen()
  }

  // 局部自定义构建函数
  @Builder ItemCard(item){
  Row({ space: 10 }) {
    Image(item.image)
      .width(100)
    Column({ space: 4 }) {
      Text(item.name)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)

      if (item.discount) {
        Text(`原价¥ ${item.price}`)
          .fontColor('#ccc')
          .fontSize(18)
          .decoration({ type: TextDecorationType.LineThrough })
        Text(`折扣价¥ ${item.discount}`)
          .priceText()
        Text(`补贴¥ ${item.price - item.discount}`)
          .priceText()
      } else {
        Text(`¥ ${item.price}`)
          .priceText()
      }
    }
    .alignItems(HorizontalAlign.Start)
  }
  .alignItems(VerticalAlign.Top)
  .backgroundColor('#fff')
  .padding(20)
  .borderRadius(20)
  .width('94%')
  .margin({ top: 10 })
}

  // 局部自定义样式
  @Styles fillScreen(){
    .padding(20)
    .height('100%')
    .width('100%')
    .backgroundColor('#f5f5f5')
  }
}