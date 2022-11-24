require 'json'
require 'fileutils'

module WriteFile

  def store_data # rubocop:disable Metrics/CyclomaticComplexity
    FileUtils.mkdir_p('storage')
    store_books unless @cache[:book].empty?
    store_genre unless @cache[:genre].empty?
    store_label unless @cache[:label].empty?
    store_author unless @cache[:author].empty?
    store_source unless @cache[:source].empty?
    store_game unless @cache[:game].empty?
    store_movie unless @cache[:movie].empty?
    # debug_cache
  end

  def store_label
    label_catalogue = []
    @cache[:label]&.each do |label|
      label_catalogue.push({ id: label.id, title: label.title, color: label.color })
    end
    File.write('storage/label.json', JSON.generate(label_catalogue))
  end

  def store_source
    source_catalogue = []
    @cache[:source]&.each do |source|
      source_catalogue.push({ id: source.id, name: source.name })
    end
    File.write('storage/source.json', JSON.generate(source_catalogue))
  end

  def store_genre
    genre_catalogue = []
    @cache[:genre]&.each do |genre|
      genre_catalogue.push({ id: genre.id, name: genre.name })
    end
    File.write('storage/genre.json', JSON.generate(genre_catalogue))
  end

  def store_author
    author_catalogue = []
    @cache[:author].each do |author|
      author_catalogue.push({ id: author.id,
                              first_name: author.first_name,
                              last_name: author.last_name,
                              book_id: author.items[0].id })
    end
    File.write('storage/author.json', JSON.generate(author_catalogue))
  end

  def store_books
    book_catalogue = []
    @cache[:book].each do |book|
      book_catalogue.push({
                            id: book.id,
                            date: book.date,
                            publisher: book.publisher,
                            cover_state: book.cover_state,
                            author_id: book.author.id
                          })
    end
    File.write('storage/books.json', JSON.generate(book_catalogue))
  end

  def store_game
    game_catalogue = []
    @cache[:game].each do |game|
      game_catalogue.push({
                            id: game.id,
                            publish_date: game.date,
                            multiplayer: game.multiplayer,
                            last_played_at: game.last_played_at,
                            source: game.source.id,
                            label: game.label.id,
                            genre: game.genre.id
                          })
    end
    File.write('storage/game.json', JSON.generate(game_catalogue))
  end

  def store_movie
    movie_catalogue = []
    @cache[:movie].each do |movie|
      movie_catalogue.push({
                             id: movie.id,
                             date: movie.date,
                             silent: movie.silent,
                             source: movie.source.id,
                             label: movie.label.id,
                             genre: movie.genre.id
                           })
    end
    File.write('storage/movie.json', JSON.generate(movie_catalogue))
  end

  def debug_cache
    @cache.each do |key, val|
      p "#{key} : "
      val&.each { |v| p v }
      puts "\n "
    end
  end
end
