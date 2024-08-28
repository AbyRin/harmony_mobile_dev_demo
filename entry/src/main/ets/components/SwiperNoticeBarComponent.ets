import { NoticeList, NoticeModel } from '../models/HomePageModel'

// 组件：轮播公告
@Component
export struct SwiperNoticeBar {
  private noticeList: NoticeModel[] = NoticeList

  build() {
    Row() {
      Image($r('app.media.ic_controlcenter_ring_on_filled'))
        .height(20)
        .margin({ right: 12 })
        .fillColor($r('app.color.PRIMARY_YELLOW'))
      Swiper() {
        ForEach(
          this.noticeList,
          (notice: NoticeModel) => {
            SwiperNoticeItem({
              noticeItem: notice
            })
          }
        )
      }
      .loop(true)
      .autoPlay(true)
      .interval(4000)
      .indicator(false)
      .vertical(true)
    }
    .width('90%')
    .padding({
      top: 8,
      bottom: 8,
      left: 16,
      right: 16
    })
    .borderRadius(8)
    .clip(true)
    .backgroundColor(Color.White)
  }
}

// 组件：轮播公告单元
@Component
struct SwiperNoticeItem {
  @Prop noticeItem: NoticeModel

  build() {
    Column() {
      Text(this.noticeItem.title)
        .fontWeight(FontWeight.Bold)
        .fontColor($r('app.color.PRIMARY_BLUE'))
    }
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Start)
  }
}