require_relative "card"

class Deck
  
  attr_accessor :cards
  
  def initialize
    @cards = []
    create_deck
  end
  
  def create_deck
    values = (1..13).to_a
    ranks = %w{2 3 4 5 6 7 8 9 10 J Q K A}
    suits = %w{Spades Hearts Diamonds Clubs}
    suits.each do |suit|
      ranks.each_index do |i|
        @cards << Card.new( ranks[i], suit, values[i] )
      end
    end
    @cards.shuffle!
  end
  
end
