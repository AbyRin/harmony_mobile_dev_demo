import { ThemeInfo } from '../models/HomePageModel'
import { router } from '@kit.ArkUI'

// 测试用数据
let themeList: ThemeInfo[] = [
  new ThemeInfo('主题1', 'app.media.1', ''),
  new ThemeInfo('主题2', 'app.media.2', ''),
  new ThemeInfo('主题3', 'app.media.3', ''),
  new ThemeInfo('主题4', 'app.media.4', ''),
  new ThemeInfo('主题5', 'app.media.5', ''),
  new ThemeInfo('主题6', 'app.media.6', ''),
  new ThemeInfo('主题7', 'app.media.7', ''),
  new ThemeInfo('主题8', 'app.media.8', ''),
]

// 组件：主题九宫格（不含More）
@Component
export struct ThemeBarWithoutMore {
  private themeList_1: ThemeInfo[] = [...themeList, new ThemeInfo('主题9', 'app.media.9', '')]

  build() {
    Column() {
      // 弹性布局
      Flex({ wrap: FlexWrap.Wrap, justifyContent: FlexAlign.SpaceBetween }) {
        ForEach(
          this.themeList_1,
          (item: ThemeInfo) => {
            ThemeItem({
              theme: item
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
      .width('90%')
    }
    .width('100%')
  }
}

// 组件：主题九宫格（含More）
@Component
export struct ThemeBar {
  private themeList_2: ThemeInfo[] = themeList

  build() {
    Column() {
      // 弹性布局
      Flex({ wrap: FlexWrap.Wrap, justifyContent: FlexAlign.SpaceBetween }) {
        ForEach(
          this.themeList_2,
          (item: ThemeInfo) => {
            ThemeItem({
              theme: item
            })
            // .onClick(() => {
            //   router.pushUrl({
            //     url:
            //   })
            //     .catch((err: Error) => console.log('路由跳转失败', JSON.stringify(err)))
            // })
          }
        )
        MoreThemeItem()// 更多主题
          .onClick(() => {
            router.pushUrl({
              url: "pages/ThemePage"
            })
              .catch((err: Error) => console.log('路由跳转失败', JSON.stringify(err)))
          })
      }
      .width('90%')
    }
    .width('100%')
  }
}

// 组件：主题单元
@Component
export struct ThemeItem {
  @Prop theme: ThemeInfo

  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      Image($r(this.theme.themeImg))
        .width('100%')
      Text(this.theme.themeTitle)
        .width('100%')
        .height(28)
        .backgroundColor('rgba(0, 0, 0, 0.6)')
        .fontColor(Color.White)
        .textAlign(TextAlign.Center)
        .align(Alignment.Top)
        .align(Alignment.Center)
    }
    .width('31%')
    .height(140)
    .borderRadius(12)
    .clip(true)
    .margin({ bottom: 8 })
  }
}

// 组件：更多主题单元
@Component
struct MoreThemeItem {
  @Prop theme: ThemeInfo

  build() {
    Stack({ alignContent: Alignment.Center }) {
      Image($r('app.media.1'))
        .width('100%')
        .backgroundColor('rgba(0, 0, 0, 0.5)')
        .foregroundBlurStyle(BlurStyle.Thin)
      Text("更多 +")
        .width('100%')
        .height(28)
        .fontColor(Color.White)
        .textAlign(TextAlign.Center)
    }
    .width('30%')
    .height(140)
    .borderRadius(12)
    .clip(true)
    .margin({ bottom: 4 })
  }
}