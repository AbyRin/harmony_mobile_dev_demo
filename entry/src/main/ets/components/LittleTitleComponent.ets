// 组件：小标题
@Component
export struct LittleTitle {
  @Prop title: string = '空白标题'
  @Prop titleColor: string = 'app.color.PRIMARY_BLUE'

  build() {
    Row() {
      Text("# " + this.title)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .fontColor($r(this.titleColor))
      Blank()
      Text("更多")
        .fontSize(16)
        .fontColor($r('app.color.PRIMARY_BLUE'))
      Image($r('app.media.ic_public_arrow_right'))
        .width(20)
        .fillColor($r('app.color.PRIMARY_BLUE'))
    }
    .width('90%')
    .height('auto')
    .padding({ top: 8, bottom: 4, left: 8 })
    .alignItems(VerticalAlign.Center)
  }
}