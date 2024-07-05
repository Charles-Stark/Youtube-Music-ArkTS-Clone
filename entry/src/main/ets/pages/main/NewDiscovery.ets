import { Card } from '../../component/Card';
import { OtherAlbum } from '../../component/OtherAlbum';
import {DataFrame,albumList} from '../../models/albumModel'
import { router } from '@kit.ArkUI';


@Entry
@Component
struct NewDiscovery {

  @Builder
  AlbumBuilder() {
    Row() {
      ForEach(albumList.slice(0,2), (album: DataFrame) => {
        OtherAlbum(album)
      }, (album: DataFrame) => album.name)
    }
    .alignItems(VerticalAlign.Top)
    .justifyContent(FlexAlign.SpaceBetween)
    .width('100%')
  }

  @Builder
  MoreBuilder() {
    Grid() {
      ForEach(albumList.slice(2,6), (album: DataFrame) => {
        GridItem(){
          OtherAlbum(album)
        }
      }, (album: DataFrame) => album.name)
    }
    .columnsTemplate('1fr 1fr')
    .columnsGap(10)
    .rowsGap(5)
    .width('100%')
    .height('100%')
  }

  build() {
    Scroll(){
      Column(){
        Row(){
          Image($rawfile('icon/back.png')).height(30)
            .onClick(()=>{
              router.back()
            })
          Image($rawfile('icon/search.png')).height(30)
        }
        .justifyContent(FlexAlign.SpaceBetween)
        .width('100%')
        .height('30')
        .margin({ top: 15})
        .padding(10)

        Card({ title: '新发行', content: this.AlbumBuilder })
          .width('100%')


        Card({ title: '专辑和单曲', content: this.MoreBuilder })
          .width('100%')
          .margin({top:10})
      }
      .width('100%')
      .height('100%')
    }
    .scrollBar(BarState.Off)
    .edgeEffect(EdgeEffect.Spring)
    .backgroundColor('#030303')
  }
}