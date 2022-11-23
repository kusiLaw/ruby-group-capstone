require './source/create_module'
require './source/storage_module'
# require './source/list_module'
require './source/instructions_module'
require './source/author'
require './source/book'
require './source/game'
require './source/source'
require './source/label'
require './source/genre'

class App
  # include List
  include Create
  # include Storage
  include Instructions

  attr_accessor :cache, :terminate

  def initialize
    @cache = {
      # book: import_books,
      # people: import_people
    }
  end

  def entry(choice)
    case choice
    when '9'
      create_book
    when '12'
      create_game
    end
  end
end
