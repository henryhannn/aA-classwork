require 'card'

  describe Card do
    subject(:card) {Card.new("J", "Spades", 11)}

    describe "#initialize" do
      it "should set @rank, @suit, and @value attributes to arguments" do
        expect(card.rank).to eq("J")
        expect(card.suit).to eq("Spades")
        expect(card.value).to eq(11)
      end

      it "should initialize @face_up attribute to be false" do
        expect(card.face_up).to be false
      end
    end

    describe "#flip" do
      it "should flip card face up" do
        card.flip
        expect(card.face_up).to be true
      end
    end

  end