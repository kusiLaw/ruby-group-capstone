class Label 
    attr_accessor :title, :color
    attr_reader :id, :items

    def initialize(title, color)
        @id = Random.rand(1000...2000)
        @title = title
        @color = color
    end

    def add_item(item)
        @items << item 
        item.label = self unless item.label == self
    end
end