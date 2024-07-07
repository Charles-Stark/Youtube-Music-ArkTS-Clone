export interface SongProps {
  image: Resource | string,
  name: string,
  creator: string,
  time: number,
}

export const songDataForHome: SongProps[] = [
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

export interface HotMusicianProps {
  image: Resource,
  name: string
  rank: number,
  views: number,
}

export const hotMusicianData: HotMusicianProps[] = [
  {
    image: $rawfile('rankList/musician/xien.jpg'),
    name: 'Parade',
    rank: 1,
    views: 2233
  },
  {
    image: $rawfile('rankList/musician/taylor.jpg'),
    name: 'Duality',
    rank: 2,
    views: 1723
  },
  {
    image: $rawfile('rankList/musician/biber.jpg'),
    name: 'Puppets',
    rank: 3,
    views: 1111
  },
  {
    image: $rawfile('rankList/musician/bb.jpg'),
    name: 'Master',
    rank: 4,
    views: 1011
  }
] 
