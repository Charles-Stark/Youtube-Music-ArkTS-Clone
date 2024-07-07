export interface AlbumProps {
  image: Resource | string,
  name: string,
  creator: string,
}

export const albumDataForHome: AlbumProps[] = [
  {
    image: 'https://is1-ssl.mzstatic.com/image/thumb/Video122/v4/d0/4c/53/d04c532e-ca0a-0ace-0847-62003931424b/Job75e8880b-4409-4b22-872b-4a2ab7bd1669-138891124-PreviewImage_preview_image_nonvideo_sdr-Time1668123397619.png/632x632bb.webp',
    name: 'American Idiot',
    creator: 'Green Day'
  },
  {
    image: 'https://is1-ssl.mzstatic.com/image/thumb/Video115/v4/3f/d8/66/3fd866f3-ca2e-c6f6-bfd5-f71aa1bea214/Job3b01e939-1eb3-496f-ac5b-18a793cbb314-122433625-PreviewImage_preview_image_nonvideo_sdr-Time1630349544215.png/632x632bb.webp',
    name: 'Nevermind',
    creator: 'Nirvana'
  },
  {
    image: 'https://is1-ssl.mzstatic.com/image/thumb/Music126/v4/11/7a/b8/117ab805-6811-8929-18b9-0fad7baf0c25/17UMGIM98210.rgb.jpg/632x632bb.webp',
    name: 'Evolve',
    creator: 'Imagine Dragons'
  },
  {
    image: 'https://is1-ssl.mzstatic.com/image/thumb/Video122/v4/ca/de/86/cade86ae-13ab-ffd6-2139-390bccaf9cfd/Jobd1f03fdd-7971-43ea-a520-8d4f8c13475e-133497443-PreviewImage_preview_image_nonvideo_sdr-Time1656540794506.png/632x632bb.webp',
    name: 'All Hope Is Gone',
    creator: 'Slipknot'
  },
]

export const albumListForNewDiscovery: AlbumProps[] = [
  {
    image: 'https://p2.music.126.net/w-8mqldatX6zKTbq25jh-g==/109951169745655929.jpg?imageView=1&type=webp&thumbnail=253y253',
    name: 'Hot Mess',
    creator: 'aespa',
  },
  {
    image: 'https://p1.music.126.net/Y5FLzPMTYt8z1zWG7U6WZQ==/109951169740387209.jpg?imageView=1&type=webp&thumbnail=253y253',
    name: 'Metamorphic',
    creator: 'STAYC',
  },
  {
    image: 'http://p1.music.126.net/V_ZoTclMFPe6ZYIpfu3TDg==/109951168064334354.jpg?imageView&thumbnail=360y360&quality=75&tostatic=0',
    name: 'POPPY',
    creator: 'STAYC',
  },
  {
    image: 'http://p1.music.126.net/tyTN9VOXlhotoqlCMMhP0w==/109951169019787784.jpg?imageView&thumbnail=360y360&quality=75&tostatic=0',
    name: 'Perfect Night',
    creator: 'LE SSERAFIM',
  },
  {
    image: 'http://p2.music.126.net/Q35_EPs6UTF9kCLmdiJKmw==/109951167817862285.jpg?imageView&thumbnail=360y360&quality=75&tostatic=0',
    name: 'Talk that Talk',
    creator: 'TWICE',
  },
  {
    image: 'http://p2.music.126.net/pOt7UrnR1PUeVmWpldu7cA==/109951168170213956.jpg?imageView&thumbnail=360y360&quality=75&tostatic=0',
    name: 'Rose Blossom',
    creator: 'H1-KEY',
  },
  {
    image: 'https://y.gtimg.cn/music/photo_new/T002R300x300M000004GpfCN2uBaY1_1.jpg?max_age=2592000',
    name: 'Back to Life',
    creator: 'Roy Wang',
  },
  {
    image: 'https://y.gtimg.cn/music/photo_new/T002R300x300M000002xZTTe3ajEPx_1.jpg?max_age=2592000',
    name: 'Fingerprints',
    creator: 'Roy Wang',
  },
  {
    image: 'http://p2.music.126.net/GZERNplXUdzTPkKqo2F4tA==/109951169217536854.jpg?imageView&thumbnail=360y360&quality=75&tostatic=0',
    name: 'Love Story',
    creator: 'Taylor Swift',
  },
]

export interface HotVideoProps extends AlbumProps {
  image: string | Resource,
  rank: number,
  views: number,
}

export const hotVideoData: HotVideoProps[] = [
  {
    image: 'https://is1-ssl.mzstatic.com/image/thumb/Video221/v4/49/25/b3/4925b3c1-bb5d-8e90-5137-1830484d6001/1968721908920101.jpg/680x382mv.webp',
    name: 'Rockstar',
    creator: 'LISA',
    rank: 1,
    views: 8718,
  },
  {
    image: 'https://is1-ssl.mzstatic.com/image/thumb/Video211/v4/04/41/c6/0441c633-c8ec-00f4-4c2c-1a0acdf71f2d/24UMGIM63464.crop.jpg/680x382mv.webp',
    name: 'Si Antes Te Hubiera Conocido',
    creator: 'KAROL G',
    rank: 2,
    views: 4425,
  },
  {
    image: 'https://is1-ssl.mzstatic.com/image/thumb/Video221/v4/70/4f/a7/704fa7d7-7fc2-c6d5-d4f1-8e989ede1267/198447018556_QZMEV2427326.jpg/1580x888sr.webp',
    name: 'Gata Only',
    creator: 'FloyyMenor和Cris Mj',
    rank: 3,
    views: 2700,
  },
  {
    image: 'https://is1-ssl.mzstatic.com/image/thumb/Music122/v4/a4/f9/58/a4f95869-c2cc-0615-237f-7e2a45ede2c3/1963621990404_cover.jpg/600x600bb.webp',
    name: 'Si No Quieres No',
    creator: 'Luis R Conriquez和Neton Vega',
    rank: 4,
    views: 1400,
  }
]
