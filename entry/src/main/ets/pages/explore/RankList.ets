import { curves, router } from '@kit.ArkUI'
import { Profile } from '../Profile'
import { hotVideo } from '../../component/Video'
import {hotMusician} from '../../component/Musician'


interface DataInterfacePlus {
  image: Resource,
  name: string,
  creator: string,
  rankList:string,
  watch:string
}

interface DataInterfaceMusician {
  image: Resource,
  name: string,
  rankList:string,
  watch:string
}

const hotVideoData: DataInterfacePlus[] = [
  {
    image: $rawfile('rankList/QueenBee.jpg'),
    name: 'Welcome to the Black Parade',
    creator: 'My Chemical Romance',
    rankList:'1',
    watch:'2233'
  },
  { image: $rawfile('rankList/Vaundy.jpg'),
    name: 'Duality',
    creator: 'Slipknot',
    rankList:'2',
    watch:'1723'
  },
  { image: $rawfile('rankList/party.jpg'),
    name: 'Master Of Puppets',
    creator: 'Metallica',
    rankList:'3',
    watch:'1111'
  },
  { image: $rawfile('rankList/barbie.jpg'),
    name: 'Master Puppets',
    creator: 'Metallica',
    rankList:'4',
    watch:'111'
  }
]
const hotMusicianData: DataInterfaceMusician[] = [
  {
    image: $rawfile('rankList/musician/xien.jpg'),
    name: 'Parade',
    rankList:'1',
    watch:'2233'
  },
  { image: $rawfile('rankList/musician/taylor.jpg'),
    name: 'Duality',
    rankList:'2',
    watch:'1723'
  },
  { image: $rawfile('rankList/musician/biber.jpg'),
    name: 'Puppets',
    rankList:'3',
    watch:'1111'
  },
  { image: $rawfile('rankList/musician/bb.jpg'),
    name: 'Master',
    rankList:'4',
    watch:'111'
  }
]

@Entry
@Component
export struct RankList {
  @State isProfilePresent: boolean = false

  @Builder
  ProfileBuilder() {
    Profile({ isProfilePresent: this.isProfilePresent })
      .transition(TransitionEffect.translate({ y: 1000 })).animation({ curve: curves.springMotion(0.6, 0.8) })
  }

  @Builder
  videoBuilder() {
    Row() {
      ForEach(hotVideoData, (data: DataInterfacePlus) => {
        hotVideo(data)
      }, (data: DataInterfacePlus) => data.name)
      hotVideo().layoutWeight(1)
    }
    .alignItems(VerticalAlign.Top)
  }

  @Builder
  musicianBuilder(){
    Column() {
      ForEach(hotMusicianData, (data: DataInterfaceMusician) => {
        hotMusician(data)
      }, (data: DataInterfaceMusician) => data.name)
      hotVideo().layoutWeight(1)
    }
  }

  build() {
    Scroll() {
      Column() {
        Row() {
          Image($rawfile('header/back.svg'))
            .height(30)
            .margin({ left: 10 })

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
        .margin({ top: 30, left: 15, right: 15 })

        Row() {
          Text('排行榜')
            .fontColor('#f6f6f6')
            .fontSize(40)
            .fontWeight(500)
            .alignSelf(ItemAlign.End)
            .padding(20)
        } //rankList
        .width('100%')

        Row() {
          Button() {
            Row() {
              Text('全球').width('60%').fontColor('#f6f6f6').textAlign(TextAlign.Start)
              Image($rawfile('rankList/down.png')).height(30)
            }
          }
          .margin({ left: 20 })
          .backgroundColor('#1c1c1c')
          .border({ width: 1, color: '#2a2a2a' })
          .height(40)
          .width(180)
          .alignSelf(ItemAlign.Start)
        } //earth
        .width('100%')
        .margin({ bottom: 30 })

        Row() {
          Text('热门音乐视频')
            .fontSize(25)
            .fontWeight(500)
            .fontColor('#f6f6f6')
            .margin({ left: 20 })
          Text('').layoutWeight(1)
          Button() {
            Text('更多').fontColor('#f6f6f6').textAlign(TextAlign.End).fontSize(12)
          }
          .margin({ left: 20 })
          .backgroundColor('#1c1c1c')
          .border({ width: 1, color: '#2a2a2a' })
          .width(40)
          .height(25)
          .alignSelf(ItemAlign.End)
          .margin({ right: 20 })
        } //hotVideoTitle
        .width('100%')
        .margin({ bottom: 15 })

        Row() {
          Text('').width(20)
          List() {
            ListItem() {
              this.videoBuilder()
            }
          }.listDirection(Axis.Horizontal)
        }
        .height(200)
        Row(){
          Text('最爱的音乐人')
            .fontSize(23)
            .fontWeight(600)
            .fontColor(Color.White)
            .margin({left:20})
        }
        .margin({top:10})
        .width('100%')


        List(){
          ListItem(){
            this.musicianBuilder()
          }
        }
        .padding(20)

      }
      .backgroundColor('#030303')
      .width('100%')
    }
  }
}
