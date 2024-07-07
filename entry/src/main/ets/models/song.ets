export interface SongProps {
  image: Resource | string,
  name: string,
  creator: string,
  time: number,
}

export const songDataForHome: SongProps[] = [
  {
    image: $rawfile('song/WelcomeToTheBlackParade.jpg'),
    name: 'Welcome to the Black Parade',
    creator: 'My Chemical Romance',
    time: 312,
  },
  {
    image: $rawfile('song/Duality.jpg'),
    name: 'Duality',
    creator: 'Slipknot',
    time: 253,
  },
  {
    image: $rawfile('song/MasterOfPuppets.jpg'),
    name: 'Master Of Puppets',
    creator: 'Metallica',
    time: 516,
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
