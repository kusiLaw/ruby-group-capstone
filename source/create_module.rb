module Create
  def create_book
    inputs = book_instruction
    book = Book.new(inputs[:date], inputs[:publisher], inputs[:cover])
    author = create_author
    book.author = author
    @cache[:book] = [*@cache[:book], book]
  end

  def create_author()
    inputs = author_instruction
    author = Author.new(inputs[:first_name], inputs[:last_name])
    @cache[:author] = [*@cache[:author], author]
    author
  end

  def create_game()
    game_input = game_instruction
    source = create_source
    genre = create_genre
    label = create_label
    game = Game.new(game_input[:published_at], game_input[:multiplayer], game_input[:last_played_at])

    game.source = source
    game.label = label
    game.genre = genre

    @cache[:game] = [*@cache[:game], game]
    game
  end

  def create_source()
    source_input = source_instructions
    source = Source.new(source_input[:item_source])
    @cache[:source] = [*@cache[:source], source]
    source
  end

  def create_label()
    label_input = label_instructions
    label = Label.new(label_input[:item_label], label_input[:item_color])
    @cache[:label] = [*@cache[:label], label]
    label
  end

  def create_genre()
    genre_input = genre_instruction
    genre = Genre.new(genre_input[:genre])
    @cache[:genre] = [*@cache[:genre], genre]
    genre
  end

  def create_movie()
    genre = create_genre
    source = create_source
    movie_input = movie_instructions
    label = create_label

    movie = Movie.new(movie_input[:watched_on], movie_input[:silent])
    movie.source = source
    movie.genre = genre
    movie.label = label

    @cache[:movie] = [*@cache[:movie], movie]
    movie
  end

  def create_music_album()
    genre = create_genre
    source = create_source
    music_input = music_ablum_intruction

    music_album = MusicAlbum.new(music_input[:release_date], music_input[:on_spotify])

    music_album.genre = genre
    music_album.source = source

    @cache[:music_album] = [*@cache[:music_album], music_album]
    music_album
  end
end
