import { curves, router } from '@kit.ArkUI'
import { MediaComponent } from '../../component/MediaComponent'
import { Profile } from '../Profile'

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
    Column() {
      Row() {
        Image($rawfile('header/logo_full.png')).height(30)

        Row() {
        }
        .layoutWeight(1)

        Button() {
          Image($rawfile('header/history.svg')).height(30)
        }
        .backgroundColor(Color.Transparent)
        .onClick(() => router.pushUrl({ url: 'pages/History' }))

        Button() {
          Image($rawfile('header/search.svg')).height(30)
        }
        .margin({ left: 7 })
        .backgroundColor(Color.Transparent)
        .onClick(() => router.pushUrl({ url: 'pages/SearchPage' }))

        Button() {
          Image($rawfile('header/profile.svg')).height(30)
        }
        .margin({ left: 7 })
        .backgroundColor(Color.Transparent)
        .bindContentCover(this.isProfilePresent, this.ProfileBuilder(), {
          modalTransition: ModalTransition.DEFAULT,
          onDisappear: () => this.isProfilePresent = false
        })
        .onClick(() => this.isProfilePresent = true)

      }
      .margin({ top: 38, left: 15, right: 15 })

      MediaComponent()

    }
    .backgroundColor('#030303')
    .height('100%')
    .width('100%')
  }
}
