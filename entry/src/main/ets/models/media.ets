export interface MediaModel {
  name: string
  id: number
  img: string
  type: string
  note: string
  num: string
}

// export const mediaModel: MediaModel[] = [
//   {
//     "name": "在黑暗的角落亵渎神明",
//     "id": "1",
//     "img": "https:\/\/img1.baidu.com\/it\/u=4001325110,1076453179&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=581",
//     "type": "播放列表",
//     "note": "YouTube Music・",
//     "num": "136首歌曲"
//   },
//   {
//     "name": "Frostbitten Metal",
//     "id": "2",
//     "img": "https:\/\/img2.baidu.com\/it\/u=2482065940,1097387630&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500",
//     "type": "播放列表",
//     "note": "YouTube Music・",
//     "num": "145首歌曲"
//   },
//   {
//     "name": "Hans Zimmer",
//     "id": "3",
//     "img": "https:\/\/img2.baidu.com\/it\/u=4010358702,2454307192&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500",
//     "type": "音乐人",
//     "note": "724万订阅者",
//     "num": ""
//   },
//   {
//     "name": "Westlife",
//     "id": "4",
//     "img": "https:\/\/img1.baidu.com\/it\/u=1756073396,1476542877&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500",
//     "type": "音乐人",
//     "note": "2025万订阅者",
//     "num": ""
//   },
//   {
//     "name": "Little Moon",
//     "id": "5",
//     "img": "https:\/\/bkimg.cdn.bcebos.com\/pic\/5882b2b7d0a20cf44f7821497f094b36adaf99b8?x-bce-process=image\/format,f_auto\/quality,Q_70\/resize,m_lfit,limit_1,w_536",
//     "type": "播放列表",
//     "note": "YouTube Music・",
//     "num": "12首歌曲"
//   },
//   {
//     "name": "Legends Of The Fall",
//     "id": "6",
//     "img": "https:\/\/img3.doubanio.com\/view\/subject\/m\/public\/s2956277.jpg",
//     "type": "播放列表",
//     "note": "QQ Music・",
//     "num": "13首歌曲"
//   },
//   {
//     "name": "Pinback",
//     "id": "7",
//     "img": "https:\/\/bkimg.cdn.bcebos.com\/pic\/566d0fdff9284e0c62279841?x-bce-process=image\/format,f_auto\/quality,Q_70\/resize,m_lfit,limit_1,w_536",
//     "type": "播放列表",
//     "note": "YouTube Music・",
//     "num": "13首歌曲"
//   },
//   {
//     "name": "Beyond",
//     "id": "8",
//     "img": "https:\/\/img2.baidu.com\/it\/u=2824804386,778206395&fm=253&fmt=auto&app=120&f=JPEG?w=378&h=193",
//     "type": "音乐人",
//     "note": "1145万订阅者",
//     "num": ""
//   },
//   {
//     "name": "Always with you",
//     "id": "9",
//     "img": "https:\/\/img0.baidu.com\/it\/u=2570945499,3417961858&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500",
//     "type": "播放列表",
//     "note": "QQ Music・",
//     "num": "102首歌曲"
//   },
//   {
//     "name": "Tree of Life",
//     "id": "10",
//     "img": "https:\/\/img0.baidu.com\/it\/u=2559383959,1505861030&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500",
//     "type": "播放列表",
//     "note": "YouTube Music・",
//     "num": "20首歌曲"
//   },
//   {
//     "name": "Road Home",
//     "id": "11",
//     "img": "https:\/\/img2.baidu.com\/it\/u=3944136724,3151597210&fm=253&fmt=auto&app=120&f=JPEG?w=800&h=500",
//     "type": "播放列表",
//     "note": "YouTube Music・",
//     "num": ""
//   },
//   {
//     "name": "Triumph",
//     "id": "12",
//     "img": "https:\/\/img2.baidu.com\/it\/u=1904323197,1212084174&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500",
//     "type": "播放列表",
//     "note": "YouTube Music・",
//     "num": ""
//   },
//   {
//     "name": "Reflections",
//     "id": "13",
//     "img": "https:\/\/img0.baidu.com\/it\/u=3709203253,816199447&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500",
//     "type": "播放列表",
//     "note": "YouTube Music・",
//     "num": "9首歌曲"
//   },
//   {
//     "name": "惬意轻音",
//     "id": "14",
//     "img": "https:\/\/img0.baidu.com\/it\/u=2619793954,1260533858&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500",
//     "type": "播放列表",
//     "note": "YouTube Music・",
//     "num": "145首歌曲"
//   },
//   {
//     "name": "One Republic",
//     "id": "15",
//     "img": "https:\/\/img2.baidu.com\/it\/u=2783346097,4021496514&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=500",
//     "type": "音乐人",
//     "note": "1985万订阅者",
//     "num": ""
//   },
//   {
//     "name": "The Beatles",
//     "id": "16",
//     "img": "https:\/\/img2.baidu.com\/it\/u=47933780,2264863939&fm=253&fmt=auto&app=120&f=JPEG?w=800&h=500",
//     "type": "音乐人",
//     "note": "2523万订阅者",
//     "num": ""
//   },
//   {
//     "name": "北欧民谣 | 寻找最初的安逸时光",
//     "id": "17",
//     "img": "https:\/\/img0.baidu.com\/it\/u=3859091294,3252471040&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500",
//     "type": "播放列表",
//     "note": "QQ Music・",
//     "num": "12首歌曲"
//   },
//   {
//     "name": "British Folk",
//     "id": "18",
//     "img": "https:\/\/img0.baidu.com\/it\/u=843453659,1259918116&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=490",
//     "type": "播放列表",
//     "note": "YouTube Music・",
//     "num": "23首歌曲"
//   },
//   {
//     "name": "Lights are on",
//     "id": "19",
//     "img": "https:\/\/t7.baidu.com\/it\/u=1338689710,4069995841&fm=217&app=126&size=f242,150&n=0&f=JPEG&fmt=auto?s=BA887A234C3F4A8838E8ACF30100C0A0&sec=1720285200&t=f6412f30de7c29c4aaaafd6764910034",
//     "type": "播放列表",
//     "note": "QQ Music・",
//     "num": "1首歌曲"
//   },
//   {
//     "name": "Country Grass",
//     "id": "20",
//     "img": "https:\/\/img0.baidu.com\/it\/u=3491058944,1657564989&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=335",
//     "type": "播放列表",
//     "note": "YouTube Music・",
//     "num": "12首歌曲"
//   },
//   {
//     "name": "So wie ich",
//     "id": "21",
//     "img": "https:\/\/img2.baidu.com\/it\/u=3925619268,3189787690&fm=253&fmt=auto&app=138&f=JPEG?w=400&h=400",
//     "type": "播放列表",
//     "note": "QQ Music・",
//     "num": "1首歌曲"
//   },
//   {
//     "name": "全世界最好听的钢琴曲",
//     "id": "22",
//     "img": "https:\/\/img2.baidu.com\/it\/u=4215006521,1170156780&fm=253&fmt=auto&app=138&f=JPEG?w=621&h=500",
//     "type": "播放列表",
//     "note": "YouTube Music・",
//     "num": "85首歌曲"
//   },
//   {
//     "name": "The Secret Life Of Walter Mitty",
//     "id": "23",
//     "img": "https:\/\/img1.baidu.com\/it\/u=1150201594,4197672149&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=375",
//     "type": "播放列表",
//     "note": "YouTube Music・",
//     "num": "11首歌曲"
//   },
//   {
//     "name": "Lana Del Rey",
//     "id": "24",
//     "img": "https:\/\/img2.baidu.com\/it\/u=3302701927,3919923913&fm=253&fmt=auto&app=138&f=JPEG?w=402&h=500",
//     "type": "音乐人",
//     "note": "1326万订阅者",
//     "num": ""
//   },
// ]
