require './source/game.rb'

game = Game.new('12/12/2020', true, '12/11/2022')

describe "Game " do 
    it 'instance is created as expected ' do 
        expect(game).to be_a Game
    end

    it 'can_be_archived returns a false value when last played at is less than 10 years ago' do 
        expect(game.can_be_archived?).to be_falsy
    end
    
    it 'can_be_archived returns a true value when last played at is more than 10 years ago' do 
        game2 = Game.new('11/11/2000', true, '11/11/2018')
        expect(game2.can_be_archived?).to be_truthy
    end
end