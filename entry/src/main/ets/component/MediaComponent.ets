import { MediaModel } from '../models/mediaModel'
import { PullToRefresh, PullToRefreshConfigurator } from '@ohos/pulltorefresh'
import axios, { AxiosResponse } from '@ohos/axios'

@Component
export struct MediaComponent {
  @State isProfilePresent: boolean = false
  private itemsPerPage: number = 10
  private currentPage: number = 1
  @State data: MediaModel[] | null = null
  private scroller: Scroller = new Scroller()
  private totalPage: number = 0
  private refreshConfigurator: PullToRefreshConfigurator = new PullToRefreshConfigurator()

  aboutToAppear(): void {
    axios.get('http://yt.c12k.dev/media', {
      params: {
        pageSize: this.itemsPerPage,
        page: this.currentPage,
      }
    })
      .then((res: AxiosResponse) => {
        if (res.status == 200) {
          this.data = res.data['mediaList']
          this.totalPage = res.data['totalPages']
        }
      })
    this.currentPage = 1
  }

  build() {
    PullToRefresh({
      data: $data,
      scroller: this.scroller,
      refreshConfigurator: this.refreshConfigurator,
      refreshText: '',

      customList: () => {
        this.listBuilder()
      },

      onRefresh: () => {
        return new Promise<string>((resolve) => {
          axios.get('http://yt.c12k.dev/media', {
            params: {
              pageSize: this.itemsPerPage,
              page: this.currentPage,
            }
          })
            .then((res: AxiosResponse) => {
              if (res.status == 200) {
                this.data = res.data['mediaList']
                this.totalPage = res.data['totalPages']
                resolve('刷新成功')
              }
            })
            .catch(() => {
              resolve('刷新失败')
            })
          this.currentPage = 1
        })
      },

      onLoadMore: () => {
        return new Promise<string>((resolve) => {
          if (this.currentPage < this.totalPage) {
            axios.get('http://yt.c12k.dev/media', {
              params: {
                pageSize: this.itemsPerPage,
                page: this.currentPage + 1,
              }
            })
              .then((res: AxiosResponse) => {
                if (res.status == 200) {
                  if (res.data['mediaList']) {
                    this.data = [...this.data as MediaModel[], ...res.data['mediaList'] as MediaModel[]]
                  }
                  this.totalPage = res.data['totalPages']
                  this.currentPage = res.data['currentPage']
                }
              })
          } else {
            this.refreshConfigurator.setHasLoadMore(false)
          }
          resolve('')
        })
      }
    })
  }

  @Builder
  listBuilder() {
    List({ scroller: this.scroller }) {
      ForEach(this.data, (item: MediaModel) => {
        ListItem() {
          Row() {
            Image(item.img)
              .width(80)
              .borderRadius(3)
              .margin({ right: 15 })
            Column() {
              Text(item.name)
                .fontSize(16)
                .fontWeight(700)
                .fontColor('#fff')
                .textOverflow({ overflow: TextOverflow.Ellipsis })
                .maxLines(1)
              Text(`${item.type}・${item.note}${item.num}`)
                .fontSize(14)
                .fontColor('#cdcdcd')
                .textOverflow({ overflow: TextOverflow.Ellipsis })
                .maxLines(1)
                .margin({ top: 7 })
            }
            .layoutWeight(1)
            .alignItems(HorizontalAlign.Start)

            Row() {
              Image($rawfile('more.svg')).width(20)
            }
          }
          .height(70)
          .alignItems(VerticalAlign.Center)
          .margin({ top: 10, left: 15, right: 15 })
        }
      })
    }
    .width('100%')
    .height('100%')
    .scrollBar(BarState.Off)
    .edgeEffect(EdgeEffect.None)
    .margin({ top: 30 })
  }
}
