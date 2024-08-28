// 组件：轮播图
@Component
export struct SearchBar {
  build() {
    Search({
      placeholder: "搜索"
    })
      .width('90%')  // 220
      .height(32)
      .backgroundColor(Color.White)
  }
}