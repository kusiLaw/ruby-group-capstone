require 'date'

class Item
  attr_accessor :date, :achieved
  attr_reader :genre, :author, :source, :label

  def initialize(genre, author, source, label, date)
    @id = Random.rand(1..1000)

    @genre = genre
    genre.items << self

    @author = author
    genre.items << self

    @source = source
    genre.items << self

    @label = label
    genre.items << self

    @date = Date.parse(date)

    @achieved = false
  end

  def can_be_archived?
    Date.today - @date > 3650
  end

  def move_to_archive()
    return unless can_be_archived?

    @achieved = true
  end
end
