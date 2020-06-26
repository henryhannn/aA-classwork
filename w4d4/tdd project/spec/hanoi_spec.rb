require 'hanoi'

  describe Game do 
    subject(:towers) {Game.new}

    

    describe "#render" do

      it "should print out game before every move" do
        expect(towers.render).to eq("[]\n[]\n[1,2,3,4]")
      end
  
    end
    
    describe "#move" do 
    
      it "should call #move and #won? helper methods" do 
        # expect(.move).to be_true
        # expect(.won?).to be_false
      end
  
    end
  
    describe "win?" do
    
      it "should return true if game is won" do
      # expect(true).to eq(game.win?)
      end
    end
end
