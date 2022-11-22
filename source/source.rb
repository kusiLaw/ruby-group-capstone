class Source
  attr_accessor :name
  attr_reader :items, :id

  def initialize(name)
    @name = name
    @id = Random.rand(400...1000)
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.source = self unless item.source == self
  end
end
