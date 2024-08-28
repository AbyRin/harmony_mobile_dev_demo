import { Header, NavBar } from '../components/CommonComponent'
import { HomePage } from '../pages/HomePage'
import { ThemePage } from '../pages/ThemePage'
import { MyPage } from '../pages/MyPage'
import { NavList, NavModel } from '../models/NavModel'
// import { display } from '@kit.ArkUI'

@Entry
@Component
struct Index {
  private scroller: Scroller = new Scroller()
  @State navList: NavModel[] = NavList
  @State currentIndex: number = 0
  @State isRefreshing: boolean = false

  // 动态布局
  // @State displayHeight: number = 0  // 屏幕高度
  @State headerHeight: Length = 77  // 头部高度，因dom尺寸获取问题，暂时使用实际值
  @State bottomHeight: Length = 79 // 底部导航栏高度，因dom尺寸获取问题，暂时使用实际值
  // @State mainHeight: number = 0  // 主要内容高度

  // aboutToAppear(): void {
  //   try {
  //     this.displayHeight = display.getDefaultDisplaySync().height
  //     console.info('TEST_获取屏幕总高度成功（转vp），值为：', px2vp(this.displayHeight))
  //   } catch (err) {
  //     console.error('TEST_获取设备屏幕高度失败', err)
  //   }
  // }

  build() {
    // 总包裹
    Stack({ alignContent: Alignment.Bottom }) {
      // 自定义刷新容器：包裹头部和主要内容
      Refresh({ refreshing: $$this.isRefreshing, builder: this.refreshComponent() }) {  // 参数：refreshing：刷新状态，使用 $$ 来进行双向绑定, builder：接收一个 builder，自定义刷新区域内容
        Stack({ alignContent: Alignment.Top }) {
          // 2.主要内容(可滚动)
          Scroll(this.scroller) {
            if (this.currentIndex === 0) {
              HomePage()
            } else if (this.currentIndex === 1) {
              ThemePage()
            } else if (this.currentIndex === 2) {
              MyPage()
            }
          }
          .width('100%')
          .height('100%')
          .margin({ top: this.headerHeight })
          .scrollable(ScrollDirection.Vertical)
          .edgeEffect(EdgeEffect.Spring)
          // .onAreaChange((newValue: Area) => {
          //   this.headerHeight = newValue.height
          //   console.log('MY_TEST_打印headerHeight值为：', JSON.parse(JSON.stringify(newValue)).height)
          // })

          // 1.通用头部
          Header({
            headerTitle: getContext(this).resourceManager.getStringSync(this.navList[this.currentIndex].text).toString() as string,
            headerIcon: this.navList[this.currentIndex].icon as Resource
          })
        }
        .backgroundColor('#eeeeee')
      }
      .onStateChange((refreshStatus: RefreshStatus) => {  // RefreshStatus 有 5 种枚举值，详见文档
        console.info('刷新状态变更 触发回调：', refreshStatus)
      })
      .onOffsetChange((value: number) => {
        console.info('下拉距离变化 触发回调：' + value)
      })
      .onRefreshing(() => {
        console.info('进入刷新状态 触发回调')
        setTimeout(() => {
          this.isRefreshing = false
        }, 2000)
      })
      .width('100%')
      .height('100%')
      .backgroundColor($r('app.color.PRIMARY_BLUE'))
      .refreshOffset(56)
      .pullToRefresh(true)

      // 3.底部导航栏
      NavBar({ currentIndex: this.currentIndex })
        .width('100%')
        .height('auto')
        // .onAreaChange((newValue: Area) => {
        //   this.bottomHeight = newValue.height
        //   console.log('MY_TEST_打印bottomHeight值为：', JSON.parse(JSON.stringify(newValue)).height)
        // })
    }
    .width('100%')
    .height('100%')
  }

  // 自定义刷新区域内容
  @Builder refreshComponent()
  {
    Stack() {
      Column() {
        Image($r('app.media.ic_gallery_cloud_synchronization'))
          .width(24)
          .fillColor($r('app.color.PRIMARY_YELLOW'))
        // LoadingProgress().height(32)
        Text("获取云同步中...")
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .fontColor($r('app.color.PRIMARY_YELLOW'))
          .padding({ top: 8 })
      }
      .alignItems(HorizontalAlign.Center)
    }
    .padding(8)
    .align(Alignment.Center)
    .clip(true)
    .constraintSize({ minHeight:32 }) // 设置最小高度约束保证自定义组件高度随刷新区域高度变化时自定义组件高度不会低于minHeight
    .width("100%")
  }

  // ------------------------------------------------------------------------
  // // 基于 Navigation 实现的 SPA
  // private tabList = TabList
  //
  // // 当前访问路由
  // @State currentPage: number = 0
  //
  // // 组件：页面标题&副标题
  // @Builder NavigationTitle() {
  //   Column() {
  //     Text(this.tabList[this.currentPage].text)
  //       .fontColor($r('sys.color.font_primary'))
  //       .fontSize(30)
  //       .lineHeight(41)
  //       .fontWeight(700)
  //     Text("副标题：当前访问页面下标为：" + this.currentPage)
  //       .fontColor($r('sys.color.font_primary'))
  //       .fontSize(14)
  //       .lineHeight(19)
  //       .opacity(0.4)
  //       .margin({ top: 2, bottom: 20 })
  //   }
  //   .alignItems(HorizontalAlign.Start)
  // }
  //
  // // 右上角功能菜单
  // @Builder NavigationMenus() {
  //   Row() {
  //     Image($r('app.media.ic_public_refresh'))
  //       .width(24)
  //       .height(24)
  //     Image($r('app.media.ic_public_add'))
  //       .width(24)
  //       .height(24)
  //       .margin({ left: 24 })
  //     Image($r('app.media.ic_public_more'))
  //       .width(24)
  //       .height(24)
  //       .margin({ left: 24 })
  //   }
  // }
  //
  // build() {
    // Column() {
    //   Navigation() {
    //     // 搜索框
    //     TextInput({placeholder: '搜索'})
    //       .width('90%')
    //       .height(40)
    //       .backgroundColor(Color.White)
    //       .margin({ top: 8 })
    //
    //     // 路由列表
    //     List({space: 12, initialIndex: 0}) {
    //       ForEach(
    //         this.tabList,
    //         (item: TabItem, index: number) => {
    //           ListItem() {
    //             // item.text、TabList[item.id].text 都会渲染出 [object Object]
    //             // 要用getContext(this).resourceManager.getStringSync($r('...'))
    //             Text(item.id + ' ' + getContext(this).resourceManager.getStringSync(item.text))
    //               .width('90%')
    //               .height(72)
    //               .backgroundColor(Color.White)
    //               .borderRadius(24)
    //               .fontSize(16)
    //               .fontWeight(500)
    //               .textAlign(TextAlign.Center)
    //           }
    //           .onClick(() => {
    //             this.currentPage = index
    //             console.log('现在跳转到页面为：', this.currentPage)
    //           })
    //         },
    //         (item: TabItem) => item.id.toString()
    //       )
    //     }
    //     .height(324)
    //     .width('100%')
    //     .margin({ top: 12, left: '10%' })
    //   }
    //   .title(this.NavigationTitle)
    //   .menus(this.NavigationMenus)
    //   .titleMode(NavigationTitleMode.Full)
    //   .toolbarConfiguration([
    //     {
    //       value: $r('app.string.tab_home'),
    //       icon: $r('app.media.ic_public_home_filled')
    //     },
    //     {
    //       value: $r('app.string.tab_theme'),
    //       icon: $r('app.media.ic_public_app_filled')
    //     },
    //     {
    //       value: $r('app.string.tab_my'),
    //       icon: $r('app.media.ic_public_contacts_filled')
    //     }
    //   ])
    //   .hideTitleBar(false)
    //   .hideToolBar(false)
    //   .onTitleModeChange((titleModel: NavigationTitleMode) => {
    //     console.info('titleMode' + titleModel)
    //   })
    //   .width('92%')
    //   .height('100%')
    //   .padding({top: 8})
    // }
    // .width('100%')
    // .height('100%')
    // .backgroundColor('#F1F3F5')
    // .alignItems(HorizontalAlign.Center)
  // }
}