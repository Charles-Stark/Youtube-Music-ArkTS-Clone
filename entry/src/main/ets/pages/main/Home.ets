import { Album } from '../../component/Album';
import { Card } from '../../component/Card';
import { CategoryButton } from '../../component/CategoryButton';
import { Song } from '../../component/Song';
import { curves, router } from '@kit.ArkUI';
import { Profile } from '../Profile';
import { albumDataForHome, AlbumProps } from '../../models/album';
import { songDataForHome, SongProps } from '../../models/song';

@Entry
@Component
export struct Home {
  @Builder
  AlbumBuilder() {
    Scroll() {
      Row() {
        ForEach(albumDataForHome, (album: AlbumProps) => {
          Album(album)
        }, (album: AlbumProps) => album.name)
        Album().layoutWeight(1)
      }
      .alignItems(VerticalAlign.Top)
    }
    .scrollable(ScrollDirection.Horizontal)
    .scrollBar(BarState.Off)
  }

  @Builder
  SongBuilder() {
    Column() {
      ForEach(songDataForHome, (song: SongProps) => {
        Song(song)
          .onClick(() => router.pushUrl({ url: 'pages/CurrentPlaying', params: song }))
      }, (song: SongProps) => song.name)
    }
    .alignItems(HorizontalAlign.Start)
  }

  @State isProfilePresent: boolean = false

  @Builder
  ProfileBuilder() {
    Profile({ isProfilePresent: this.isProfilePresent })
      .transition(TransitionEffect.translate({ y: 1000 })).animation({ curve: curves.springMotion(0.6, 0.8) })
  }

  build() {
    Scroll() {
      Column() {
        Row() {
          Image($rawfile('header/logo_full.png')).height(30)

          Row() {
          }
          .layoutWeight(1)

          Button() {
            Image($rawfile('header/notification.svg')).height(30)
          }
          .backgroundColor(Color.Transparent)
          .onClick(() => router.pushUrl({ url: 'pages/Notification' }))

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
          })
          .onClick(() => this.isProfilePresent = true)
        }
        .margin({ top: 38, left: 15, right: 15 })

        Row() {
          CategoryButton({ content: '健身' }).margin({ right: 10 })
          CategoryButton({ content: '专注' }).margin({ right: 10 })
          CategoryButton({ content: '放松' }).margin({ right: 10 })
          CategoryButton({ content: '通勤' }).margin({ right: 10 })
          CategoryButton().layoutWeight(1)
        }
        .margin({ top: 35, left: 15, right: 15 })

        Card({ title: '为你推荐', content: this.AlbumBuilder })

        Card({ title: '再听一次', content: this.SongBuilder })
      }
      .backgroundColor('#030303')
    }
    .scrollable(ScrollDirection.Vertical)
    .scrollBar(BarState.Off)
  }
}
