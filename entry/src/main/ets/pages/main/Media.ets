import { curves, router } from '@kit.ArkUI'
import { Profile } from '../Profile'

import {MediaComponent} from '../../component/MediaComponent'


@Entry
@Component
export struct Media {
  @State isProfilePresent: boolean = false

  @Builder
  ProfileBuilder() {
    Profile({ isProfilePresent: this.isProfilePresent })
      .transition(TransitionEffect.translate({ y: 1000 })).animation({ curve: curves.springMotion(0.6, 0.8) })
  }

  build() {
    Column(){
      // Column() {
      //   Row() {
      //     Image($rawfile('header/logo_full.png')).height(30)
      //
      //     Row() {
      //     }
      //     .layoutWeight(1)
      //
      //     Button() {
      //       Image($rawfile('header/history.svg')).height(30)
      //     }
      //     .backgroundColor(Color.Transparent)
      //
      //     Button() {
      //       Image($rawfile('header/search.svg')).height(30)
      //     }
      //     .margin({ left: 7 })
      //     .backgroundColor(Color.Transparent)
      //     .onClick(() => router.pushUrl({ url: 'pages/SearchPage' }))
      //
      //     Button() {
      //       Image($rawfile('header/profile.svg')).height(30)
      //     }
      //     .margin({ left: 7 })
      //     .backgroundColor(Color.Transparent)
      //     .bindContentCover(this.isProfilePresent, this.ProfileBuilder(), {
      //       modalTransition: ModalTransition.DEFAULT,
      //       onDisappear: () => this.isProfilePresent = !this.isProfilePresent
      //     })
      //     .onClick(() => this.isProfilePresent = !this.isProfilePresent)
      //
      //   }
      //   .margin({ top: 30, left: 15, right: 15 })
      //
      //   //页顶按钮
      //   Row(){
      //     CategoryButton({ content: '播放列表' }).margin({ right: 10 })
      //     CategoryButton({ content: '歌曲' }).margin({ right: 10 })
      //     CategoryButton({ content: '专辑' }).margin({ right: 10 })
      //     CategoryButton({ content: '音乐人' }).margin({ right: 10 })
      //   }
      //   .width('100%')
      //   .margin({left: 15, top: 20})
      //
      //   Row(){
      //     Text('近期活动').fontColor('#fff').margin({left: 15, right: 15})
      //     Image($rawfile('header/down.png')).width(15)
      //   }
      //   .width('100%')
      //   .margin({top: 20})
      //
      //
      // }

      // .backgroundColor('#030303')
      // .height('100%')
      // .width('100%')

      Column(){
        MediaComponent()
      }
      .backgroundColor('#000')


    }
    .backgroundColor('#000')

  }



}
