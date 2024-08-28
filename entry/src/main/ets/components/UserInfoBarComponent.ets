import { UserModel } from '../models/UserModel'

// 组件：用户头像与昵称
@Component
export struct AvatarBar {
  @Prop userInfo: UserModel[]

  build() {
    Column({space: 12}) {
      // 头像
      Column() {
        Image(this.userInfo.filter(item => ['avatar'].includes(item.id))[0].value as Resource)
      }
      .width(120)
      .height(120)
      .borderRadius('50%')
      .clip(true)
      // 昵称
      Text(this.userInfo.filter(item => ['nickname'].includes(item.id))[0].value as string)
        .fontWeight(FontWeight.Bold)
        .fontSize(24)
        .fontColor($r('app.color.PRIMARY_BLUE'))
        .textAlign(TextAlign.Center)
      // 昵称
      Text("uid  " + this.userInfo.filter(item => ['uid'].includes(item.id))[0].value as string)
        .fontSize(16)
        .fontColor(Color.Gray)
    }
    .width('90%')
    .height('auto')
    .padding({top: 16, bottom: 10})
    .borderRadius(16)
    .backgroundColor(Color.White)
  }
}

// 组件：用户信息栏
@Component
export struct UserInfoBar {
  @Prop userInfo: UserModel[]

  build() {
    Column() {
      ForEach(
        this.userInfo,
        (item: UserModel) => {
          UserInfoItem({
            infoId: item.id,
            infoIcon: item.icon,
            infoKey: item.key,
            // 除了头像都是 str/num，而这里没渲染头像
            infoValue: item.value as string | number
          })
        }
      )
    }
    .width('90%')
    .height('auto')
    .borderRadius(12)
    .margin({top: 20})
    .backgroundColor(Color.White)
    .clip(true)
  }
}

// 组件：用户信息单元
@Component
export struct UserInfoItem {
  @Prop infoId: string
  @Prop infoIcon: Resource
  @Prop infoKey: string
  @Prop infoValue: number | string

  build() {
    Row() {
      // 图标自匹配色
      if (this.infoId === 'like') {
        IconBuilder({ icon: this.infoIcon, color: $r('app.color.PRIMARY_RED') })
      } else if (this.infoId === 'star') {
        IconBuilder({ icon: this.infoIcon, color: $r('app.color.PRIMARY_YELLOW') })
      } else if (this.infoId === 'comment') {
        IconBuilder({ icon: this.infoIcon, color: $r('app.color.PRIMARY_GREEN') })
      } else {
        IconBuilder({ icon: this.infoIcon, color: $r('app.color.PRIMARY_BLUE') })
      }
      // 键
      Text(this.infoKey)
        .fontWeight(FontWeight.Bold)
        .fontColor($r('app.color.PRIMARY_BLUE'))
      Blank()
      // 值
      Text(typeof this.infoValue === 'string' || typeof this.infoValue === 'string' ? this.infoValue : this.infoValue.toString())
        .width('72%')
        .fontColor(Color.Gray)
        .textAlign(TextAlign.End)
    }
    .width('100%')
    .height('auto')
    .borderWidth(1)
    .borderColor('#eeeeee')
    .padding({top: 8, bottom: 8, left: 16, right: 12})
  }
}
// 图标构建
@Component
export struct IconBuilder {
  @Prop icon: Resource
  @Prop color: Resource

  build() {
    Row() {
      Image(this.icon)
        .height(16)
        .margin({right: 4})
        .fillColor(this.color)
    }
  }
}

// 组件：按钮组
@Component
export struct ButtonBar {
  build() {
    Row({space: 12}) {
      Button('编辑信息')
        .myButtonStyle()
        .fontWeight(FontWeight.Bold)
        .backgroundColor($r('app.color.PRIMARY_BLUE'))
      Button('退出登录')
        .myButtonStyle()
        .fontWeight(FontWeight.Bold)
        .backgroundColor($r('app.color.PRIMARY_RED'))
    }
    .width('90%')
    .height('auto')
    .justifyContent(FlexAlign.Center)
    .alignItems(VerticalAlign.Center)
  }
}

@Styles function myButtonStyle() {
  .layoutWeight(1)
  .padding({top: 8, bottom: 8, left: 12, right: 12})
  .backgroundColor($r('app.color.PRIMARY_BLUE'))
}