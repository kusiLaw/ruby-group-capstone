require '../source/item'
class MusicAlbum < Item
  attr_accessor :title, :on_spotify, :archived

  def initialize(title, on_spotify)
    super(title)
    @on_spotify = on_spotify
    @archived = false
  end

  private

  def can_be_archived?
    @archived = super && @on_spotify
  end
end
