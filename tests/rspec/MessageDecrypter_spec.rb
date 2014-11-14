require_relative('../../MessageDecrypter')

describe MessageDecrypter do
  #arrange
  before :all do
    @messagedecrypter = MessageDecrypter.new
  end

  #act/assert
  describe "#decryptmessage" do
    it "should decrypt the message using an unkeyed deck" do
      @messagedecrypter.decrypt_message("GLNCQ MJAFF FVOMB JIYCB").should eq ['CODEI','NRUBY','LIVEL','ONGER']
    end

    it "should decrypt the message using an unkeyed deck2" do
      @messagedecrypter.decrypt_message("CLEPK HHNIY CFPWH FDFEH").should eq ["YOURC", "IPHER", "ISWOR", "KINGX"]
    end

    it "should decrypt the message using an unkeyed deck3" do
      @messagedecrypter.decrypt_message("ABVAW LWZSY OORYK DUPVH").should eq ["WELCO", "METOR", "UBYQU", "IZXXX"]
    end

  end
end
