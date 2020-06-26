require 'deck'

  describe Deck do
    subject(:deck) {Deck.new}

    describe "#initialize" do
      it 'initializes @deck to be a deck of cards' do
        expect(deck.cards).not_to be_empty 
      end

      it 'creates a deck of 52 cards' do
        expect(deck.cards.length).to eq(52)
      end
    end
  end
