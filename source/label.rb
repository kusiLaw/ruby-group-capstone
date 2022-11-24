class Label
  attr_accessor :title, :color
  attr_reader :id, :items

  def initialize(title, color, id = -1)
    @id = if id == -1
            Random.rand(1000...2000)
          else
            id
          end
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.label = self unless item.label == self
  end
end
