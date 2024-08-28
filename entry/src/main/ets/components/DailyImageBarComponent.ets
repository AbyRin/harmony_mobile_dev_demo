// 组件：每日推荐
import { ImageInfo } from '../models/HomePageModel'

@Component
export struct DailyImageBar {
  private scroller: Scroller = new Scroller()
  private dailyImageList: ImageInfo[] = [
    new ImageInfo(4, '图片标题4', '主题A'),
    new ImageInfo(6, '图片标题6', '主题B'),
    new ImageInfo(8, '图片标题8', '主题C'),
    new ImageInfo(1, '图片标题1', '主题D'),
    new ImageInfo(5, '图片标题5', '主题E'),
    new ImageInfo(2, '图片标题2', '主题F'),
    new ImageInfo(7, '图片标题7', '主题G'),
    new ImageInfo(3, '图片标题3', '主题H'),
    new ImageInfo(9, '图片标题9', '主题I'),
  ]

  build() {
    Column() {
      // 滚动栏
      Scroll(this.scroller) {
        Row({ space: 4 }) {
          ForEach(
            this.dailyImageList,
            (item: ImageInfo) => {
              DailyImageItem({
                imgItem: item
              })
              // .onClick(() => {
              //   router.pushUrl({
              //     url:
              //   })
              //     .catch((err: Error) => console.log('路由跳转失败', JSON.stringify(err)))
              // })
            }
          )
        }
      }
      .width('90%')
      .height(180)
      .scrollable(ScrollDirection.Horizontal)
      .scrollBar(BarState.Off)
      .edgeEffect(EdgeEffect.Spring)
    }
    .width('100%')
  }
}

// 组件：每日推荐单元
@Component
struct DailyImageItem {
  @Prop imgItem: ImageInfo

  build() {
    Column() {
      Image($r(`app.media.${this.imgItem.imageId}`))
    }
    .width(80)
    .borderRadius(12)
    .clip(true)
    .margin({ left: 4, right: 4 })
  }
}
