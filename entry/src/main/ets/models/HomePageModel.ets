// 类：公告信息
export interface NoticeModel {
  title: string  // 公告标题
  url: string  // 公告地址
}

export const NoticeList: NoticeModel[] = [
  {
    title: '8/22 新规约公告',
    url: 'pages/Notice'
  },
  {
    title: '8/21 0:00~6:00 例行维护公告',
    url: 'pages/Notice'
  },
  {
    title: '8/21 更新闪断公告',
    url: 'pages/Notice'
  }
]

// 类：图片信息
export class ImageInfo {
  imageId: number  // 图片id
  imageTitle: string  // 图片标题
  imageTheme: string  // 图片主题

  constructor(imageId: number, imageTitle: string, imageTheme: string) {
    this.imageId = imageId
    this.imageTitle = imageTitle
    this.imageTheme = imageTheme
  }
}

// 类：主题信息
export class ThemeInfo {
  themeTitle: string  // 公告标题
  themeImg: string  // 公告地址
  themeUrl: string  // 公告地址

  constructor(themeTitle: string, themeImg: string, themeUrl: string) {
    this.themeTitle = themeTitle
    this.themeImg = themeImg
    this.themeUrl = themeUrl
  }
}