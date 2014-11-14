require_relative('../../MessageEncrypter')

describe MessageEncrypter do
  #arrange
  before :all do
    @messagencypter = MessageEncrypter.new
  end

  describe "#encryptmessage" do
    it "should encrypt the message using an unkeyed deck" do
      @messagencypter.encrypt_message("Code In Ruby Live Longer").should eq ['GLNCQ','MJAFF','FVOMB','JIYCB']
    end

  end


end