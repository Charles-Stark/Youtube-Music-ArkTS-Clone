import { curves, router } from '@kit.ArkUI'
import { Profile } from '../Profile'

import { MediaComponent } from '../../component/MediaComponent'


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
      MediaComponent()
    }
    .backgroundColor('#000')

  }
}
