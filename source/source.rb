require 'securerandom'
class Source
    attr_accessor :id, :name
    attr_reader :items
    def initialize(name)
        @id = SecureRandom.random_number(1000)
        @name = name
        @items = []
    end    

        end

    def add_item(item)
        @items << item unless @items.include?(item)
        item.source = self
    end

    def self.list_all_sources(sources)
      puts 'No sources found in Database.' if sources.empty?
        sources.each do |source|
            puts "Source Name: #{source.name}"
        end
    end
end
