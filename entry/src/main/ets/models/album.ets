export interface AlbumProps {
  image: Resource | string,
  name: string,
  creator: string,
}

export const albumDataForHome: AlbumProps[] = [
  { image: $rawfile('album/AmericanIdiot.jpg'), name: 'American Idiot', creator: 'Green Day' },
  { image: $rawfile('album/AllHopeIsGone.jpg'), name: 'All Hope Is Gone', creator: 'Slipknot' },
  { image: $rawfile('album/AllHopeIsGone.jpg'), name: 'Al Hope Is Gone', creator: 'Slipknot' },
  { image: $rawfile('album/AllHopeIsGone.jpg'), name: 'Allope Is Gone', creator: 'Slipknot' },
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
  image: Resource,
  rank: number,
  views: number,
}

export const hotVideoData: HotVideoProps[] = [
  {
    image: $rawfile('rankList/QueenBee.jpg'),
    name: 'Welcome to the Black Parade',
    creator: 'My Chemical Romance',
    rank: 1,
    views: 2233,
  },
  {
    image: $rawfile('rankList/Vaundy.jpg'),
    name: 'Duality',
    creator: 'Slipknot',
    rank: 2,
    views: 1723,
  },
  {
    image: $rawfile('rankList/party.jpg'),
    name: 'Master Of Puppets',
    creator: 'Metallica',
    rank: 3,
    views: 1111,
  },
  {
    image: $rawfile('rankList/barbie.jpg'),
    name: 'Master Puppets',
    creator: 'Metallica',
    rank: 4,
    views: 1101,
  }
]
