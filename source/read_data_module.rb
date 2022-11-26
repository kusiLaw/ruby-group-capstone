require 'json'
require 'fileutils'

module ReadFile # rubocop:disable Metrics/ModuleLength
  def restore_data
    @cache[:author] = import_author
    @cache[:genre] = import_genre
    @cache[:source] = import_source
    @cache[:label] = import_label
    @cache[:book] = import_books
    @cache[:game] = import_game
    @cache[:movie] = import_movie
    @cache[:music_album] = import_music_album
  end

  def import_author
    author_store = 'storage/author.json'
    if File.exist? author_store
      JSON.parse(File.read(author_store)).map do |author|
        Author.new(author['first_name'], author['last_name'], author['id'])
      end
    else
      []
    end
  end

  def import_genre
    genre_store = 'storage/genre.json'
    if File.exist? genre_store
      JSON.parse(File.read(genre_store)).map do |genre|
        Genre.new(genre['name'], genre['id'])
      end
    else
      []
    end
  end

  def import_source
    source_store = 'storage/source.json'
    if File.exist? source_store
      JSON.parse(File.read(source_store)).map do |source|
        Source.new(source['name'], source['id'])
      end
    else
      []
    end
  end

  def import_label
    label_store = 'storage/label.json'
    if File.exist? label_store
      JSON.parse(File.read(label_store)).map do |label|
        Label.new(label['title'], label['color'], label['id'])
      end
    else
      []
    end
  end

  def import_books
    book_store = 'storage/books.json'
    if File.exist? book_store
      JSON.parse(File.read(book_store)).map do |book|
        author = identify_object(book['author_id'], :author) # [0]
        book_obj = Book.new(book['date'], book['publisher'], book['cover_state'], book['id'])
        book_obj.author = author
        book_obj
      end
    else
      []
    end
  end

  def import_game
    game_store = 'storage/game.json'
    if File.exist? game_store
      JSON.parse(File.read(game_store)).map do |game|
        label = identify_object(game['label'], :label) # [0]
        source = identify_object(game['source'], :source) # [0]
        genre = identify_object(game['genre'], :genre) # [0]
        game = Game.new(game['publish_date'], game['multiplayer'], game['last_played_at'], game['id'])
        game.label = label
        game.source = source
        game.genre = genre
        game
      end
    else
      []
    end
  end

  def import_movie
    movie_store = 'storage/movie.json'
    if File.exist? movie_store
      JSON.parse(File.read(movie_store)).map do |movie|
        label = identify_object(movie['label'], :label) # [0]
        source = identify_object(movie['source'], :source) # [0]
        genre = identify_object(movie['genre'], :genre) # [0]
        movie = Movie.new(movie['date'], movie['silent'], movie['id'])
        movie.label = label
        movie.source = source
        movie.genre = genre
        movie
      end
    else
      []
    end
  end

  def import_music_album
    music_album_store = 'storage/music_album.json'
    if File.exist? music_album_store
      JSON.parse(File.read(music_album_store)).map do |music|
        source = identify_object(music['source'], :source) # [0]
        genre = identify_object(music['genre'], :genre) # [0]

        music = MusicAlbum.new(music['date'], music['on_spotify'], music['id'])
        music.source = source
        music.genre = genre
        music
      end
    else
      []
    end
  end

  def identify_object(id, type)
    @cache[type].find { |item| item.id.to_i == id.to_i }
  end
end
