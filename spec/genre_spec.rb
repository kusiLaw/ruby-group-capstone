require './source/genre'
require './source/music_album'

describe Genre do
  before(:each) do
    @genre = Genre.new('comedy')
    @music = MusicAlbum.new('2020-10-1', true)
  end

  context 'Book could be created:' do
    it 'Created book created should be an instance of Book' do
      expect(@genre).to be_an_instance_of Genre
    end
  end

  context 'Author instance properties be access:' do
    it 'Author first_name should reflect first_name agument' do
      expect(@genre.name).to eq 'comedy'
    end

    it 'Author items should be emptied' do
      expect(@genre.items.length).to eq 0
    end
  end

  context 'Author one-to-many relationship could be created' do
    it 'Author items should have book instance' do
      @genre.add_item(@music)
      expect(@genre.items[0]).to be_an_instance_of MusicAlbum
    end
  end
end
