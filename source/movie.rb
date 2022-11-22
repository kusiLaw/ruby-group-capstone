class Movie
    def initialize(*args, silet)
        super(*args)
        @silet = false

    end

    def self.lits_all_movies(movies)
       puts 'Sorry No mivies found, please add a movie.' if movies.empty?
        movies.each do |movie|
            puts "Name: #{movie.name} Author: #{movie.author} Genre: #{movie.genre} "
        end    
    end
    private

    def can_be_archived?
        super || @silet
    end
end
