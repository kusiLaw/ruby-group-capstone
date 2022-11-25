require './source/create_module'
require './source/write_module'
require './source/read_data_module'
require './source/list_module'
require './source/instructions_module'
require './source/author'
require './source/book'
require './source/game'
require './source/source'
require './source/label'
require './source/genre'
require './source/movie'
require './source/music_album'

class App
  include List
  include Create
  include WriteFile
  include ReadFile
  include Instructions

  attr_accessor :cache, :terminate

  def initialize
    @cache = {}
    restore_data
    debug_cache
  end

  def entry(choice) # rubocop:disable Metrics CyclomaticComplexity
    case choice
    when '1' then list_all_books
    when '2' then list_all_music_albums
    when '3' then list_all_movies
    when '4' then list_all_games
    when '5' then list_all_genres
    when '6' then list_all_labels
    when '7' then list_all_author
    when '8' then list_all_sources
    when '9' then create_book
    when '10' then create_music_album
    when '11' then create_movie
    when '12' then create_game
    end
  end
end
