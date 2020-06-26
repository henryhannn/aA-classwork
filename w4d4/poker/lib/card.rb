class Card
  attr_reader :rank, :suit, :value, :face_up

  def initialize(rank, suit, value)
    @rank = rank
    @suit = suit
    @value = value
    @face_up = false
  end
  
  def flip
    @face_up = true
  end

end