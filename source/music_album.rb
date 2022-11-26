require_relative '../source/item'
class MusicAlbum < Item
  attr_accessor :date, :on_spotify, :archived

  def initialize(date, on_spotify, id = -1)
    super(date, id)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super() && @on_spotify
  end
end
