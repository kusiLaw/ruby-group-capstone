require './source/movie.rb'

movie = Movie.new('12/11/2022', true)

describe "Movie " do 
    it 'instance is created as expected ' do 
        expect(movie).to be_a Movie
    end

    it 'can_be_archived returns true because the silent is set to true in the instance created ' do 
        expect(movie.can_be_archived?).to be_truthy
    end

    it 'can_be_archived returns false when the silent parameter passed is set to false ' do 
        movie2 = Movie.new('12/11/2022', false)
        expect(movie2.can_be_archived?).to be_falsy
    end

    it 'can be archived returns true if the last played date is more than 10 years ago ' do 
        movie3 = Movie.new('10/10/2010', false)
        expect(movie3.can_be_archived?).to be_truthy
    end
  
end