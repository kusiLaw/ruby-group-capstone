require './source/create_module'
require './source/storage_module'
require './source/list_module'
require './source/instructions_module'
require './source/author'
require './source/book'

class App
  include List
  include Create
  include Storage
  include Instructions

  attr_accessor :cache, :terminate

  def initialize
    @cache = {}
    restore_data
  end

  def entry(choice)
    case choice
    when '1'
      list_all_books
    when '7'
      list_all_author
    when '9'
      create_book
    end
  end
end
