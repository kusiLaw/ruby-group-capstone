require './item'
class Movie < Item
  def initialize(date, _silent)
    super(date)
    @silent = false
  end

  private

  def can_be_archived?
    super || @silent
  end
end
