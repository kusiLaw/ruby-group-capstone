require '../source/item'
class MusicAlbum < Item
  attr_accessor :date, :on_spotify, :archived

  def initialize(date, on_spotify)
    super(date)
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
     super() && @on_spotify
  end
end
