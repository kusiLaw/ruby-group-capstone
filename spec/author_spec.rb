require './source/author'
require './source/book'

describe Author do
  before(:each) do
    @book = Book.new('2010-10-10', 'Book Inc', 'good')
    @author = Author.new('Lawrence', 'Kusi')
  end

  context 'Book could be created:' do
    it 'Created book created should be an instance of Book' do
      expect(@author).to be_an_instance_of Author
    end
  end

  context 'Author instance properties be access:' do
    it 'Author first_name should reflect first_name agument' do
      expect(@author.first_name).to eq 'Lawrence'
    end

    it 'Author last_name should reflect last_name agument' do
      expect(@author.last_name).to eq 'Kusi'
    end

    it 'Author items should be emptied' do
      expect(@author.items.length).to eq 0
    end
  end

  context 'Author one-to-many relationship could be created' do
    it 'Author items should have book instance' do
      @author.add_item(@book)
      expect(@author.items[0]).to be_an_instance_of Book
    end
  end
end
