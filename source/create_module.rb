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
    genre_input = genre_instruction
    source_input = source_instructions
    label_input = label_instructions

    game = Game.new(game_input[:published_at], game_input[:multiplayer], game_input[:last_played_at])
    genre = Genre.new(genre_input[:genre])
    source = Source.new(source_input[:item_source])
    label = Label.new(label_input[:item_source], label_input[:item_color])

    game.source = source
    game.label = label
    game.genre = genre
    game
  end
end
