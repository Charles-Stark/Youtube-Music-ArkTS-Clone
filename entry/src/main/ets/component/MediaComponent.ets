import { MediaModel } from '../models/media'
import { PullToRefresh, PullToRefreshConfigurator } from '@ohos/pulltorefresh'
import axios, { AxiosResponse } from '@ohos/axios'
import { router } from '@kit.ArkUI'

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
    axios.get('https://yt.c12k.dev/media', {
      params: {
        pageSize: this.itemsPerPage,
        page: 1,
      }
    })
      .then((res: AxiosResponse) => {
        if (res.status == 200) {
          this.data = res.data['mediaList']
          this.totalPage = res.data['totalPages']
        }
      })
  }

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
          axios.get('https://yt.c12k.dev/media', {
            params: {
              pageSize: this.itemsPerPage,
              page: 1,
            }
          })
            .then((res: AxiosResponse) => {
              if (res.status == 200) {
                this.data = res.data['mediaList']
                this.totalPage = res.data['totalPages']
                this.currentPage = 1
                this.refreshConfigurator.setHasLoadMore(true)
                resolve('刷新成功')
              }
            })
            .catch(() => {
              resolve('刷新失败')
            })
        })
      },

      onLoadMore: () => {
        return new Promise<string>((resolve) => {
          this.currentPage++
          if (this.currentPage <= this.totalPage) {
            axios.get('https://yt.c12k.dev/media', {
              params: {
                pageSize: this.itemsPerPage,
                page: this.currentPage,
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
            this.currentPage--
            // this.refreshConfigurator.setHasLoadMore(false)
          }
          resolve('')
        })
      },
      customLoad: null,
      customRefresh: null,
    })
  }

  @Builder
  listBuilder() {
    if (this.data) {
      List({ scroller: this.scroller }) {
        ForEach(this.data, (item: MediaModel) => {
          ListItem() {
            Row() {
              Image(item.img)
                .width(80)
                .height(80)
                .borderRadius(item.type === '播放列表' ? 3 : 90)
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
            .alignItems(VerticalAlign.Center)
            .margin({ top: 12, left: 15, right: 15 })
          }
          .onClick(() => {
            if (item.type === '播放列表') {
              router.pushUrl({ url: 'pages/Playlist', params: item })
            }
          })
        })
      }
      .width('100%')
      .scrollBar(BarState.Off)
      .edgeEffect(EdgeEffect.None)
      .margin({ top: 20, bottom: 80 })
    } else {
      Scroll(this.scroller) {
        Column() {
          Image($rawfile('explore/music-icon.png'))
            .height(50)
            .margin({ top: 200, bottom: 20 })
          Text('暂无内容')
            .fontColor(Color.White)
            .fontSize(18)
        }
      }
    }
  }
}
