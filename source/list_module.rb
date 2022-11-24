module List
  def list_all_author
    @cache[:author]&.each do |author|
      puts "Id: #{author.id}  Name: #{author.first_name}  #{author.last_name} "
    end
    puts ' '
  end

  def list_all_books
    @cache[:book]&.each do |book|
      puts "Id: #{book.id} author: #{book.author.first_name} #{book.author.last_name} \
publisher: #{book.publisher} date: #{book.date}"
    end
    puts ' '
  end
end
