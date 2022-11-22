require '../source/item'
class Book < Item
    attr_accessor :publisher, :cover_state, :archived
  def initialize(date, title, publisher, cover_state)
    super(date, title)
    @publisher = publisher
    @cover_state = cover_state
    @archived = false
  end

  private

  def can_be_archived?
   @archived = super || @cover_state == 'bad'
end