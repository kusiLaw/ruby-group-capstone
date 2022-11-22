require './source/item'

class Author
  attr_accessor :first_name, :last_name, :items
  attr_reader :id

  def initialize(first_name, last_name)
    @id = Random.rand(1..1000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items.push(item) if item.is_a? Item
  end
end

aut = Author.new('lawrence', 'kusi')
book = Book.new('bookLink inc', '2020-10-10')

# book.author = aut
# p book.author
# p book.can_be_archived?

aut.add_item(book)
p aut.items
