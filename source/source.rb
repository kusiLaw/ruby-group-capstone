class Source
  attr_accessor :name
  attr_reader :items, :id

  def initialize(name, id = -1)
    @id = if id == -1
            Random.rand(400...1000)
          else
            id
          end
    @name = name

    @items = []
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.source = self unless item.source == self
  end
end
