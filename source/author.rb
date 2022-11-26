require './source/item'

class Author
  attr_accessor :first_name, :last_name, :items, :id

  def initialize(first_name, last_name, id = -1)
    @id = if id == -1
            Random.rand(1..1000)
          else
            id
          end
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items.push(item) if item.is_a? Item
  end
end
