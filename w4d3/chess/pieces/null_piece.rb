require 'singleton'

class NullPiece  
    attr_reader :symbol
    include Singleton 
    def initialize
        @symbol = " "
        @color = ""
    end

    def empty?
        true
    end

    def moves
        []
    end
end