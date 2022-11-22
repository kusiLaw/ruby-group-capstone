class Source 
    attr_accessor :name
    attr_reader :items, :id

    def initialize(name)
        @name = name
        @id = Random.rand(4000...5000000)
    end

    def add_item(item)
        @items << item
        item.source = self unless item.source == self
    end

end