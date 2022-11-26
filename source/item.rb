require 'date'

class Item
  attr_accessor :date, :archived, :id
  attr_reader :genre, :author, :source, :label

  def initialize(date, id = -1)
    @id = if id == -1
            Random.rand(1..1000)
          else
            id
          end
    @date = Date.parse(date)
    @archived = false
  end

  def genre=(genre)
    @genre = genre
    genre.items << self unless genre.items.include?(self)
  end

  def author=(author)
    @author = author
    author.items << self unless author.items.include?(self)
  end

  def source=(source)
    @source = source
    source.items << self unless source.items.include?(self)
  end

  def label=(label)
    @label = label
    label.items << self unless label.items.include?(self)
  end

  def can_be_archived?
    Date.today - @date > 3650
  end

  def move_to_archive()
    return unless can_be_archived?

    @archived = true
  end
end
