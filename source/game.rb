require_relative './item'
require 'date'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(publish_date, multiplayer, last_played_at, id = -1)
    super(publish_date, id)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?()
    super() && Date.today - Date.parse(@last_played_at) > 730
  end
end
