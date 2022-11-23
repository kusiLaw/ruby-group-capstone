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
    @cache[:author] = [*@cache[:book], author]
    author
  end

  def create_game()
    
  end
end
