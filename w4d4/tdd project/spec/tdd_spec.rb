require 'tdd'

describe 'TDD' do

    describe '#my_uniq' do
        it 'should raise error if array is empty' do
            expect{[].my_uniq}.to raise_error(ArgumentError)
        end
        
        it 'should return an array of unique elements' do
            expect([1, 2, 1, 3, 3].my_uniq).to eq([1, 2, 3])
        end
    end

    describe '#two_sum' do
        it 'should raise error if array is less than two' do
            expect{[].two_sum}.to raise_error(ArgumentError)
        end
    
        it 'should return a 2D array of pairs that sum to zero' do
            expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
        end

    end

    describe "#my_transpose" do
    let(:matrix) { [
          [0, 1, 2],
          [3, 4, 5],
          [6, 7, 8]
        ] }
      it "should raise error if self[0].length is not equal to self.length" do
        expect(matrix.length).to eq(matrix[0].length) #aise_error(ArgumentError)
      end

      it "should return an array transposed" do
        expect(matrix.my_transpose).to eq(matrix.transpose)
      end

    end

    describe "#stock_picker" do

      it "should return a pair array where second day is after first" do
        expect([1, 3, 4, 6, 9, 10, 6, 13, 15].stock_picker).to eq([1, 3, 4, 6, 9, 10, 6, 13, 15].stock_picker.sort)
      end
    
      it "should return most profitable pair of days in the array" do
        expect([1, 3, 4, 6, 9, 10, 6, 13, 15].stock_picker).to eq([0,8])
      end
    end 

end