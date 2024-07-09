import { curves, router } from '@kit.ArkUI'
import { Profile } from '../Profile'

@Entry
@Component
export struct Upgrade {
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
      .margin({
        top: 38,
        bottom: 20,
        left: 15,
        right: 15
      })

      Image($rawfile('upgrade.jpeg'))
        .width('100%')
    }
    .backgroundColor('#030303')
    .height('100%')
    .width('100%')
  }
}
