require_relative('../../Deck')

describe Deck do
  before :all do
    @decktest = Deck.new
  end

  describe "#generatingkeystream" do
    it "should return a keystream" do
      @decktest.generate_keystream('CODEINRUBY'.length).should eq ['DWJXH','YRFDG']
    end

    describe "#shiftinglocation" do
      it "should return 1 when shifting past 53" do
        @decktest.calculate_new_position(53+1).should eq 1
      end

      it "should return 3 when shifting past 52 by 4" do
        @decktest.calculate_new_position(52+4).should eq 3
      end

      it "should return 25 when shifting past 21 by 4" do
        @decktest.calculate_new_position(21+4).should eq 25
      end
    end
  end
end
