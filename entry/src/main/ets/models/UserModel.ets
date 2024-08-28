// 类：用户信息
export interface UserModel {
  id: string,
  icon?: Resource
  key: string,
  value: number | string | Resource
}

export const UserInfo: UserModel[] = [
  { id: "avatar", key: "头像", value: $r('app.media.6') },
  { id: "uid", key: "用户id", value: '1919810' },
  { id: "nickname", key: "昵称", value: '测试用昵称' },
  { id: "email", icon: $r('app.media.ic_public_email_filled'), key: "邮箱", value: '123456@outlook.com' },
  { id: "birthday", icon: $r('app.media.ic_contacts_birthday_filled'), key: "生日", value: '2024-01-01' },
  { id: "address", icon: $r('app.media.ic_public_gps_filled'), key: "地址", value: '测试用地址，增加长度增加长度增加长度增加长度增加长度增加长度' },
  { id: "like", icon: $r('app.media.ic_public_thumbsup_filled'), key: "点赞", value: 11 },
  { id: "star", icon: $r('app.media.ic_public_highlightsed'), key: "收藏", value: 45 },
  { id: "comment", icon: $r('app.media.ic_screenshot_penshape'), key: "评论", value: 14 },
]