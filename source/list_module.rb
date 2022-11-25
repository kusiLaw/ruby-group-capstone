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

  def list_all_games
    @cache[:game]&.each do |game|
      print "Id: #{game.id}, Published on: #{game.date},"
      print " Multiplayer: #{game.multiplayer}, last played on: #{game.last_played_at}"
    end
    puts ' '
  end

  def list_all_genres
    @cache[:genre]&.each do |genre|
      puts "Id: #{genre.id}, Name: #{genre.name}"
    end
    puts ' '
  end

  def list_all_labels
    @cache[:label]&.each do |label|
      puts "Id: #{label.id}, title: #{label.title}, color: #{label.color}"
    end
    puts ' '
  end

  def list_all_sources
    @cache[:source]&.each do |src|
      puts "Id: #{src.id}, name: #{src.name}"
    end
    puts ' '
  end

  def list_all_movies
    @cache[:movie]&.each do |movie|
      puts "Id: #{movie.id}, Watched on: #{movie.date}, Silent: #{movie.silent}"
    end
    puts ' '
  end

  def list_all_music_albums 
    @cache[:music_album]&.each do |album| 
      puts "Id: #{album.id}, Realease date: #{album.date}, Is on spotify: #{album.on_spotify}"
    end
    puts ' '
  end
end
