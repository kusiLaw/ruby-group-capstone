require_relative './item'

class Movie < Item
  attr_accessor :silent 
  def initialize(date, _silent)
    super(date)
    @silent = _silent
  end

  private

  def can_be_archived?
    super || @silent
  end
end
