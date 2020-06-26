require_relative "deck"

class Hand

  attr_accessor :hand, :deck

  def initialize(deck)
    @deck = deck
    @hand = []
    draw_starting
  end
  
  def draw_starting
    5.times do 
      value = deck.cards.shift
      hand << value
    end
  end
  
  def hand_value
    
  end

end
