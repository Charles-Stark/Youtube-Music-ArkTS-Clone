export interface SongProps {
  img: Resource | string,
  name: string,
  creator: string,
  time: number,
}

export const songDataForHome: SongProps[] = [
  {
    img: 'https://is1-ssl.mzstatic.com/image/thumb/Video115/v4/02/d3/af/02d3afe2-5fae-2e4c-9cd1-974955af5f90/Jobdb669b7a-c67a-4897-8005-d7348ec69d06-125081753-PreviewImage_PreviewImageIntermediate_preview_image_nonvideo_vfcs220814178-Time1634747359209.png/632x632bb.webp',
    name: 'Welcome to the Black Parade',
    creator: 'My Chemical Romance',
    time: 312,
  },
  {
    img: 'https://is1-ssl.mzstatic.com/image/thumb/Video112/v4/c5/dc/ce/c5dccef7-b9e5-e69c-da23-0c2ecca6c99e/Job01c753c1-4ec0-4807-8c4e-2f8a5872f9e2-133531714-PreviewImage_preview_image_nonvideo_sdr-Time1656605968154.png/632x632bb.webp',
    name: 'Duality',
    creator: 'Slipknot',
    time: 253,
  },
  {
    img: 'https://is1-ssl.mzstatic.com/image/thumb/Music112/v4/94/f7/1b/94f71ba1-a4d5-1f97-9438-1694dd2a3490/17UM1IM19945.rgb.jpg/632x632bb.webp',
    name: 'Master Of Puppets',
    creator: 'Metallica',
    time: 516,
  },
  {
    img: 'https://is1-ssl.mzstatic.com/image/thumb/Music124/v4/2b/f6/b1/2bf6b19e-2995-f2ce-e01a-ed098e6d4719/18UMGIM24877.rgb.jpg/632x632bb.webp',
    name: 'Sweet Child O\' Mine',
    creator: 'Guns N\' Roses',
    time: 357,
  },
]

export interface HotMusicianProps {
  image: string | Resource,
  name: string
  rank: number,
  views: number,
}

export const hotMusicianData: HotMusicianProps[] = [
  {
    image: 'https://is1-ssl.mzstatic.com/image/thumb/AMCArtistImages112/v4/1d/39/4e/1d394ed5-279c-3186-4b30-e139a3f93adc/8e1d4c20-f1b8-48de-becd-8be82c903060_ami-identity-994af5c375f4c3aa96cd6ced4a700799-2024-03-28T12-56-11.536Z_cropped.png/220x220bb.webp',
    name: 'Taylor Swift',
    rank: 1,
    views: 5940,
  },
  {
    image: 'https://is1-ssl.mzstatic.com/image/thumb/Features115/v4/87/8e/a0/878ea0a1-ed8d-6fd7-3567-76ab8e6529af/mzl.ayuccyos.jpg/220x220bb.webp',
    name: 'Eminem',
    rank: 2,
    views: 6090
  },
  {
    image: 'https://is1-ssl.mzstatic.com/image/thumb/Features112/v4/ab/50/ef/ab50ef3b-c936-44f0-7b01-bb113a133547/mza_5527770582281912184.png/220x220bb.webp',
    name: 'Kendrick Lamar',
    rank: 3,
    views: 1530
  },
  {
    image: 'https://is1-ssl.mzstatic.com/image/thumb/AMCArtistImages112/v4/1b/71/65/1b716513-b0c1-9c6b-45aa-cbb9198248cc/01607cf1-1d52-43d2-84ce-d6fc1f4a3475_ami-identity-7665599cc626d803af7956b3691905e7-2022-11-30T21-07-19.526Z_cropped.png/220x220bb.webp',
    name: 'Drake',
    rank: 4,
    views: 3000
  }
] 
