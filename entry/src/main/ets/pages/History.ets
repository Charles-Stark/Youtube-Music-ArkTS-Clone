import { curves, router } from '@kit.ArkUI'
import { SongProps } from '../models/song'
import { Profile } from './Profile'

@Entry
@Component
struct History {
  @State isProfilePresent: boolean = false
  private data: SongProps[] = [
    {
      image: 'https://is1-ssl.mzstatic.com/image/thumb/Video115/v4/02/d3/af/02d3afe2-5fae-2e4c-9cd1-974955af5f90/Jobdb669b7a-c67a-4897-8005-d7348ec69d06-125081753-PreviewImage_PreviewImageIntermediate_preview_image_nonvideo_vfcs220814178-Time1634747359209.png/632x632bb.webp',
      name: 'Welcome to the Black Parade',
      creator: 'My Chemical Romance',
      time: 312,
    },
    {
      image: 'https://is1-ssl.mzstatic.com/image/thumb/Video112/v4/c5/dc/ce/c5dccef7-b9e5-e69c-da23-0c2ecca6c99e/Job01c753c1-4ec0-4807-8c4e-2f8a5872f9e2-133531714-PreviewImage_preview_image_nonvideo_sdr-Time1656605968154.png/632x632bb.webp',
      name: 'Duality',
      creator: 'Slipknot',
      time: 253,
    },
    {
      image: 'https://is1-ssl.mzstatic.com/image/thumb/Music112/v4/94/f7/1b/94f71ba1-a4d5-1f97-9438-1694dd2a3490/17UM1IM19945.rgb.jpg/632x632bb.webp',
      name: 'Master Of Puppets',
      creator: 'Metallica',
      time: 516,
    },
    {
      image: 'https://is1-ssl.mzstatic.com/image/thumb/Music124/v4/2b/f6/b1/2bf6b19e-2995-f2ce-e01a-ed098e6d4719/18UMGIM24877.rgb.jpg/632x632bb.webp',
      name: 'Sweet Child O\' Mine',
      creator: 'Guns N\' Roses',
      time: 357,
    },
  ]

  @Builder
  ProfileBuilder() {
    Profile({ isProfilePresent: this.isProfilePresent })
      .transition(TransitionEffect.translate({ y: 1000 })).animation({ curve: curves.springMotion(0.6, 0.8) })
  }

  build() {
    Column() {
      Row() {
        Button() {
          Image($rawfile('header/back.svg')).height(25)
        }
        .backgroundColor(Color.Transparent)
        .margin({ right: 5 })
        .onClick(() => router.back())

        Text('历史记录')
          .fontColor(Color.White)
          .fontSize(22)
          .margin({ left: 5 })

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
          onDisappear: () => this.isProfilePresent = !this.isProfilePresent
        })
        .onClick(() => this.isProfilePresent = !this.isProfilePresent)
      }
      .margin({ top: 38, left: 15, right: 15 })

      Scroll() {
        Column() {
          ForEach(this.data, (item: SongProps) => {
            Row() {
              Image(item.image)
                .width(80)
                .height(80)
                .borderRadius(3)
                .margin({ right: 15 })
              Column() {
                Text(item.name)
                  .fontSize(16)
                  .fontWeight(700)
                  .fontColor('#fff')
                  .textOverflow({ overflow: TextOverflow.Ellipsis })
                  .maxLines(1)
                Text(item.creator)
                  .fontSize(14)
                  .fontColor('#cdcdcd')
                  .textOverflow({ overflow: TextOverflow.Ellipsis })
                  .maxLines(1)
                  .margin({ top: 7 })
              }
              .layoutWeight(1)
              .alignItems(HorizontalAlign.Start)

              Row() {
                Image($rawfile('header/close.svg')).width(20)
              }
            }
            .alignItems(VerticalAlign.Center)
            .margin({ top: 12, left: 15, right: 15 })
          })
        }
      }
      .margin({ top: 15 })
    }
    .backgroundColor('#030303')
    .height('100%')
    .width('100%')
  }
}
