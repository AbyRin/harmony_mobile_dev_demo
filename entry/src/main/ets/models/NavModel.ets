// 底部导航栏
export interface NavModel {
  id: number;
  icon: Resource;
  text: Resource;
}

// tabId
export enum NavId {
  HOME,
  THEME,
  MY
}

export const NavList: NavModel[] = [
  {
    id: 0,
    icon: $r('app.media.ic_public_home_filled'),
    text: $r('app.string.tab_home')
  },
  {
    id: 1,
    icon: $r('app.media.ic_public_app_filled'),
    text: $r('app.string.tab_theme')

  },
  {
    id: 2,
    icon: $r('app.media.ic_public_contacts_filled'),
    text: $r('app.string.tab_my')
  }
]






