export interface AlbumProps {
  image: Resource,
  name: string,
  creator: string,
}

export const albumDataForHome: AlbumProps[] = [
  { image: $rawfile('album/AmericanIdiot.jpg'), name: 'American Idiot', creator: 'Green Day' },
  { image: $rawfile('album/AllHopeIsGone.jpg'), name: 'All Hope Is Gone', creator: 'Slipknot' },
]
