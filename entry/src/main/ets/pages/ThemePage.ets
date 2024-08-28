import { ThemeBarWithoutMore } from '../components/ThemeBarComponent'

@Entry
@Component
struct ThemePage {
  build() {
    Column() {
      ThemeBarWithoutMore()
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
  }
}

export { ThemePage }