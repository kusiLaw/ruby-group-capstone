require './source/music_album.rb'

music_album = MusicAlbum.new('12/12/2020', true)

describe 'Music album ' do 
    it 'instance created as expected ' do 
        expect(music_album).to be_a MusicAlbum
    end 

    it 'returns false if it is on spotify but its lauch date is less than 10 years ago' do 
        expect(music_album.can_be_archived?).to be_falsy
    end

    it 'returns false if not on spotify ' do 
        music_album2 = MusicAlbum.new('12/12/2021', false)
        expect(music_album2.can_be_archived?).to be_falsy
    end 

    it 'returns true if launched more than 10 years ago and is on spotify' do 
        music_album3 = MusicAlbum.new('11/11/2011', true)
        expect(music_album3.can_be_archived?).to be_truthy
    end
end 