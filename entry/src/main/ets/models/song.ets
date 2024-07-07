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
