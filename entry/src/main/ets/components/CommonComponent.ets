import { NavList, NavModel } from '../models/NavModel'

// 头部
@Component
export struct Header {
  @Prop headerTitle: string
  @Prop headerIcon: Resource

  build() {
    Row() {
      // 1.头部标题
      Image(this.headerIcon)
        .width(28)
        .fillColor($r('app.color.PRIMARY_YELLOW'))
        .margin({right: 12})
      Text(this.headerTitle)
        .fontWeight(FontWeight.Bold)
        .fontColor($r('app.color.PRIMARY_YELLOW'))
        .fontSize(24)
        .padding({top: 2})
      Blank()
      // 3.右上图标
      Badge({
        count: 3,
        maxCount: 9,
        position: BadgePosition.RightTop,
        style: {badgeSize: 14, badgeColor: $r('app.color.PRIMARY_RED')}
      }) {
        Image($r('app.media.ic_public_email_filled'))
          .width(28)
          .fillColor(Color.White)
      }
    }
    .width('100%')
    .height('auto')
    .padding({ top: 10, bottom: 10, left: 12, right : 12 })
    .backgroundColor($r('app.color.PRIMARY_BLUE'))
    .justifyContent(FlexAlign.Center)
  }
}

// 底部导航栏
@Component
export struct NavBar {
  // 导航列表
  @State navList: NavModel[] = NavList
  @Link currentIndex: number

  build() {
    // 渲染底部导航栏
    Row() {
      ForEach(
        this.navList,
        (item: NavModel, index: number) => {
          NavBarItem({
            navInfo: item,
            isSelected: this.currentIndex === index
          })
            .onClick(() => {
              // 修改当前访问页面
              this.currentIndex = index
            })
        }
      )
    }
    .width('100%')
    .height('auto')
    .padding({ top: 8, bottom: 8 })
    .justifyContent(FlexAlign.SpaceEvenly)
    .alignItems(VerticalAlign.Center)
    .backgroundColor($r('app.color.PRIMARY_BLUE'))
  }
}

// 组件：底部导航栏单元
@Component
struct NavBarItem {
  @Prop navInfo: NavModel
  @Prop isSelected: boolean

  build() {
    Column() {
      Image(this.navInfo.icon)
        .fillColor(this.isSelected ? $r('app.color.PRIMARY_BLUE') : Color.White)
        .width(25)
    }
    .width('30%')
    .height('auto')
    .padding(4)
    .backgroundColor(this.isSelected ? $r('app.color.PRIMARY_YELLOW') : $r('app.color.PRIMARY_BLUE'))
    .borderRadius('12%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}