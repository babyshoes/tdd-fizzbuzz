require './fizzbuzz'

RSpec.describe FizzBuzz do
  before :each do
    @fizzbuzz = FizzBuzz.new(100)
  end

  describe "#initialize" do
    it "takes a parameter of i and returns a FizzBuzz object" do
      expect(@fizzbuzz).to be_a FizzBuzz
    end
  end

  describe "#make_array" do
    it "arr has i number of elements in it" do
      expect(@fizzbuzz.arr.count).to eq([*1..100].count)
    end
  end

  describe "#translate" do
    context "when number is divisible by 3" do
      it "returns word 'fizz'" do
        expect(@fizzbuzz.translate(3)).to eq('fizz')
        expect(@fizzbuzz.translate(66)).to eq('fizz')
      end
    end

    context "when number is divisible by 5" do
      it "returns 'buzz'" do
        expect(@fizzbuzz.translate(5)).to eq('buzz')
        expect(@fizzbuzz.translate(50)).to eq('buzz')
      end
    end

    context "when number is divisible by 15" do
      it "returns 'fizzbuzz'" do
        expect(@fizzbuzz.translate(15)).to eq('fizzbuzz')
      end
    end

    context "results in array with numbers and replaced strings" do
      before :each do
        @output = @fizzbuzz.arr.map! {|num| num = @fizzbuzz.translate(num) }
      end
      it "is the same length as original arr" do
        expect(@fizzbuzz.arr.count).to eq(@output.count)
      end
      it "contains the word 'fizzbuzz'" do
        expect(@output).to include('fizzbuzz')
      end
    end
  end

  describe "#print" do
    it "returns translated array" do
      output = @fizzbuzz.arr.map! {|num| num = @fizzbuzz.translate(num) }
      expect(STDOUT).to receive(:puts).with(output)
      @fizzbuzz.print
    end
  end

end
