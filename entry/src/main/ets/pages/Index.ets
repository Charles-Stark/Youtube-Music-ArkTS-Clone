import { Explore } from './main/Explore'
import { Home } from './main/Home'
import { Media } from './main/Media'
import { Upgrade } from './main/Upgrade'

@Entry
@Component
struct Index {
  @State currentIndex: number = 0

  build() {
    Column() {
      Tabs({ barPosition: BarPosition.End }) {
        TabContent() {
          Column() {
            Home()
          }
          .width('100%')
          .height('100%')
        }
        .tabBar(this.tabBuilder('首页', 0, $rawfile('tab/home_fill.svg'), $rawfile('tab/home.svg')))

        TabContent() {
          Column() {
            Explore()
          }
          .width('100%')
          .height('100%')
        }
        .tabBar(this.tabBuilder('探索', 1, $rawfile('tab/explore_fill.svg'), $rawfile('tab/explore.svg')))

        TabContent() {
          Column() {
            Media()
          }
          .width('100%')
          .height('100%')
        }
        .tabBar(this.tabBuilder('媒体库', 2, $rawfile('tab/media_fill.svg'), $rawfile('tab/media.svg')))

        TabContent() {
          Column() {
            Upgrade()
          }
          .width('100%')
          .height('100%')
        }
        .tabBar(this.tabBuilder('升级', 3, $rawfile('tab/upgrade_fill.svg'), $rawfile('tab/upgrade.svg')))

      }
      .scrollable(false)
      .barMode(BarMode.Fixed)
      .onChange((index: number) => {
        this.currentIndex = index
      })
    }
    .width('100%')
    .backgroundColor('#030303')

  }

  @Builder
  tabBuilder(title: string, targetIndex: number, selectedImg: Resource, normalImg: Resource) {
    Column() {
      Image(this.currentIndex === targetIndex ? selectedImg : normalImg)
        .size({ width: 25, height: 25 })
      Text(title)
        .margin(3)
        .fontSize(11)
        .fontColor($r('sys.color.white'))
        .fontWeight(this.currentIndex === targetIndex ? FontWeight.Bold : FontWeight.Normal)
    }
    .backgroundColor('#212121')
    .width('100%')
    .height(60)
    .justifyContent(FlexAlign.Center)
  }
}
