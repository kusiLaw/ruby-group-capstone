require './source/item'

class Genre
  attr_accessor :name, :items, :id

  def initialize(name, id = -1)
    @id = if id == -1
            Random.rand(1..1000)
          else
            id
          end
    @name = name
    @items = []
  end

  def add_item(item)
    @items.push(item) if item.is_a? Item
  end
end
