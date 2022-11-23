require './app'

def main # rubocop:disable Metrics/MethodLength
  app = App.new
  until app.terminate
    puts 'Please choose an option by entering a number:
    1 - List all books
    2 - List all music albums
    3 - List all movies
    4 - List of games
    5 - List all genres
    6 - List all labels
    7 - List all authors
    8 - List all sources
    9 - Add a book
    10 - Add a music album
    11 - Add a movie
    12 - Add a game
    0 - Exit'
    choice = gets.chomp
    if choice == '0'
      app.store_data
      app.terminate = true
    end
    app.entry(choice)
  end
  puts 'Thank you for using this app!'
end

main
