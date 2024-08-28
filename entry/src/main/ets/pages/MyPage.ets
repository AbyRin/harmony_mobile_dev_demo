import { UserInfo, UserModel } from '../models/UserModel'
import { AvatarBar, ButtonBar, UserInfoBar } from '../components/UserInfoBarComponent'

@Entry
@Component
struct MyPage {
  @State userInfo: UserModel[] = UserInfo

  build() {
    Column({space: 8}) {
      // 1.用户头像与昵称
      AvatarBar({
        userInfo: this.userInfo.filter(item => ['avatar', 'nickname', 'uid'].includes(item.id))
      })

      // 2.用户信息_1
      UserInfoBar({
        userInfo: this.userInfo.filter(item => ['like', 'star', 'comment'].includes(item.id))
      })

      // 3.用户信息_2
      UserInfoBar({
        userInfo: this.userInfo.filter(item => ['email', 'birthday', 'address'].includes(item.id))
      })

      Blank()

      // 4.按钮组
      ButtonBar()
    }
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Center)
    .width('100%')
    .height('100%')
  }
}

export { MyPage }