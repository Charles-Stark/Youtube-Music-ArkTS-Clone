import { curves, router } from '@kit.ArkUI'
import {MediaModel, mediaModel} from '../models/mediaModel'
import {PullToRefresh, PullToRefreshConfigurator} from '@ohos/pulltorefresh'

@Component
export struct MediaComponent {
  @State isProfilePresent: boolean = false

  private itemsPerPage: number = 10
  private currentPage: number = 1
  @State data: MediaModel[] = mediaModel.slice(0, this.itemsPerPage)

  private scroller: Scroller = new Scroller()
  private totalPage: number = Math.ceil(mediaModel.length/this.itemsPerPage)
  private refreshConfigurator: PullToRefreshConfigurator = new PullToRefreshConfigurator()

build() {
  PullToRefresh({
    data: $data,
    scroller: this.scroller,
    refreshConfigurator: this.refreshConfigurator,
    customList: () => {
      this.listBuilder()
    },

    onRefresh: () => {
      return new Promise<string>((resolve) => {
        setTimeout(() => {
          resolve('刷新成功')
          this.data = mediaModel.slice(0, this.itemsPerPage)
          this.currentPage = 1
        }, 2000)
      })
    },

    onLoadMore: () => {
      return new Promise<string>((resolve) => {
        setTimeout(() => {
          resolve('')
          if(this.currentPage < this.totalPage){
            this.data = [
              ...this.data,
              ...mediaModel.slice(this.itemsPerPage * this.currentPage, this.itemsPerPage * this.currentPage + this.itemsPerPage)
            ]
            this.currentPage++
          } else {
            this.refreshConfigurator.setHasLoadMore(false)
          }

        }, 2000)
      })
    }
  })
}
  @Builder
  listBuilder(){
    List({scroller: this.scroller}){
      ForEach(this.data, (item: MediaModel) => {
        ListItem(){
          Row(){
            Image(item.img)
              .width(80)
              .margin({left: 10, right: 10})
            Column(){
              Text(item.name)
                .fontSize(16)
                .fontWeight(700)
                .fontColor('#fff')
                .margin({left: 10})
                .textOverflow({overflow: TextOverflow.Ellipsis})
                .maxLines(1)
              Text(`${item.text1}・${item.text2}${item.num}`)
                .fontSize(14)
                .fontColor('#cdcdcd')
                .height(16)
                .textOverflow({overflow: TextOverflow.Ellipsis})
                .maxLines(1)
                .margin({left: 10, top: 10})
            }
            .layoutWeight(1)
            .alignItems(HorizontalAlign.Start)
            .height('100%')

            Row(){
              Image($rawfile('header/more.png')).width(20)
            }
          }
          .height(67)
          .alignItems(VerticalAlign.Top)
          .margin({top: 10})
        }
      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#000')
    .scrollBar(BarState.Off)
    .edgeEffect(EdgeEffect.None)
  }
}