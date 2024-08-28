import { router } from '@kit.ArkUI'

@Extend(Text) function SplashFont() {
  .fontColor($r('app.color.PRIMARY_YELLOW'))
  .fontSize(30)
  .fontWeight(FontWeight.Bold)
}

@Entry
@Component
struct Splash {

  // 跳转至主页
  // onPageShow() 也无用
  aboutToAppear(): void {
    setTimeout(() => {
      router.replaceUrl({
        url: 'pages/Index'
      }, 3000)
    })
  }

  build() {
    Column({space: 10}) {
      Image($r('app.media.asuka'))
        .width(100)
      Text('这是启动页')
        .SplashFont()
      Text('2s后跳转至主页')
        .SplashFont()
        .fontSize(20)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .backgroundColor($r('app.color.PRIMARY_BLUE'))
  }
}