require 'json'
require 'fileutils'

module Storage
  # create folder and store all data
  def store_data
    FileUtils.mkdir_p('storage')
    store_books unless @cache[:book].empty?
    store_author unless @cache[:book].empty?
  end

  # update caches with the data in json file
  def restore_data
    @cache[:author] = import_author
    @cache[:book] = import_books
  end

  def import_books
    book_store = 'storage/books.json'
    if File.exist? book_store
      JSON.parse(File.read(book_store)).map do |book|
        # find author object
        author = identify_object(book['author_id'], :author)[0]
        # create book, assign author, and return
        book_obj = Book.new(book['date'], book['publisher'], book['cover_state'], book['id'])
        book_obj.author = author
        book_obj
      end
    else
      []
    end
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

  def identify_object(id, type)
    @cache[type].find { |item| item.id.to_i == id.to_i }
    p @cache[type]
  end
end
