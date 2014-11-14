require_relative('../../MessageUtility')

describe MessageUtility do
  before :all do
    @messageutility = MessageUtility.new
  end

  describe "#convertmessagetonumericarray" do
    it "should return a numeric array" do
      @messageutility.convert_message_to_numeric_array(['ABCDE','FGHIJ']).should eq([[1,2,3,4,5],[6,7,8,9,10]])
    end
  end

  describe "#combinesnumericarraywithkeystream" do
    it "should return a numeric array" do
      @messageutility.combine_numeric_array([[1,2,3,4,5],[6,7,8,9,26]],[[1,2,3,4,5],[6,7,8,9,1]]).should eq([[2,4,6,8,10],[12,14,16,18,1]])
    end
  end

  describe "#convertnumericarraytoencryptedmessage" do
    it "should return the encrypted numeric array as a character array" do
      @messageutility.convert_numeric_array_to_message([[1,2,3,4,5],[6,7,8,9,10]]).should eq ['ABCDE','FGHIJ']
    end
  end

  describe "#formatmessage" do

    it "should remove all non A to Z characters" do
      @messageutility.format_message("This is a Test, over!").should eq(['THISI','SATES','TOVER'])
    end

    it "should return all upper case letters" do
      @messageutility.format_message('This').should eq(['THISX'])
    end

    it "should split the message into 5 letter groups" do
      @result = @messageutility.format_message("This is a Test ove")
      @result.each do |item|
        expect(item.length).to eq 5
      end
    end

    it "should pad non-factors of 5 with the appropriate number of X's" do
      @result = @messageutility.format_message('This is a Test').should eq ['THISI','SATES','TXXXX']
    end
  end
end
