// 组件：轮播图
@Component
export struct SwiperImageBar {
  private imageList = [
    'app.media.2',
    'app.media.4',
    'app.media.6',
  ]

  build() {
    Swiper() {
      ForEach(
        this.imageList,
        (item: string) => {
          SwiperImageItem({
            imgUrl: item
          })
        }
      )
    }
    .width('90%')
    .height(160)
    .loop(true)
    .autoPlay(true)
    .interval(4000)
    .indicator(
      Indicator.dot()
        .left(0)
        .selectedColor($r('app.color.PRIMARY_GREEN'))
    )
  }
}

// 组件：轮播图单元
@Component
struct SwiperImageItem {
  @Prop imgUrl: string

  build() {
    Column() {
      Image($r(this.imgUrl))
    }
    .borderRadius(12)
    .clip(true)
  }
}