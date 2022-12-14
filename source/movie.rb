require_relative './item'

class Movie < Item
  attr_accessor :silent

  def initialize(date, silent, id = -1)
    super(date, id)
    @silent = silent
  end

  def can_be_archived?
    super || @silent
  end
end
