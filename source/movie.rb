require './item'
class Movie < Item
    def initialize( *all, silent)
        super(*all)
        @silent = false

    end
    private

    def can_be_archived?
        super || @silent
    end
end
