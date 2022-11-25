require './source/source'
require './source/game'

source = Source.new('Amazon')
game = Game.new('12/12/2020', true, '12/12/2022')

describe 'Source ' do
  it 'a source instance is created ' do
    expect(source).to be_a Source
  end

  it 'the add_item method for the source class' do
    source.add_item(game)
    expect(source.items.length).to be(1)
  end
end
