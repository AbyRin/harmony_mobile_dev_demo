import { SearchBar } from '../components/SearchBarComponent'
import { SwiperImageBar } from '../components/SwiperImageBarComponent'
import { SwiperNoticeBar } from '../components/SwiperNoticeBarComponent'
import { DailyImageBar } from '../components/DailyImageBarComponent'
import { ThemeBar } from '../components/ThemeBarComponent'
import { LittleTitle } from '../components/LittleTitleComponent'

@Entry
@Component
struct HomePage {
  build() {
    Column({ space: 10 }) {
      // 0.搜索框
      SearchBar()

      // 1.轮播图
      SwiperImageBar()

      // 2.轮播公告栏
      SwiperNoticeBar()

      // 3.每日推荐
      // 组件：小标题
      LittleTitle({ title: "每日推荐", titleColor: 'app.color.PRIMARY_BLUE' })
      DailyImageBar()

      // 4.主题九宫格
      // 组件：小标题
      LittleTitle({ title: "热门主题", titleColor: 'app.color.PRIMARY_BLUE' })
      ThemeBar()
    }
    .justifyContent(FlexAlign.Start)
  }
}

export { HomePage }
