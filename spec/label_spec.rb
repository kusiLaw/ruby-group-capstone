require './source/movie.rb'
require './source/label.rb'

label = Label.new('sold', 'red')
movie = Movie.new('12/12/2022', true)

describe "Label" do 
    it 'instance is created as expected ' do 
        expect(label).to be_a Label
    end

    it 'add_item adds an insance of any given item to the items list' do 
        label.add_item(movie)
        expect(label.items.length).to be(1)
    end

end