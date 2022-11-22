require 'date'

class Item
  attr_accessor :date, :archived
  attr_reader :genre, :author, :source, :label

  def initialize(genre, author, source, label, date)
    @id = Random.rand(1..1000)

    @genre = genre
    genre.items << self

    @author = author
    author.items << self

    @source = source
    source.items << self

    @label = label
    label.items << self

    @date = Date.parse(date)

    @archived = false
  end

  def can_be_archived?
    Date.today - @date > 3650
  end

  def move_to_archive()
    return unless can_be_archived?

    @archived = true
  end
end
