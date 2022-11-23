module Instructions
  def book_instruction
    print 'Publisher : '
    publisher = gets.chomp
    print 'Date: '
    date = gets.chomp
    print 'Cover_state? press 1 = good, 2 = bad: '
    cover = gets.chomp
    cover = cover.to_i == 1 ? 'good' : 'bad'
    { publisher: publisher, date: date, cover: cover }
  end

  def author_instruction
    print "Author's First Name: "
    first_name = gets.chomp
    print "Author's last Name: "
    last_name = gets.chomp
    { first_name: first_name, last_name: last_name }
  end

  def genre_instruction
    print 'Genre ?: '
    genre = gets.chomp
    { genre: genre }
  end

  def game_instruction 
    print 'Multiplayer: 1. True or 2. false'
    multiplayer = gets.chomp 
    print 'Last played at: '
    last_played_at = gets.chomp 
    {multiplayer: multiplayer, last_played_at: last_played_at}
  end

  def label_instruction 
    print 'label: ' 
    item_label = gets.chomp
    {item_label: item_label}
  end

  def source_instructions 
    print 'Source: '
    item_source = gets.chomp
    {item_source: item_source} 
  end

end
