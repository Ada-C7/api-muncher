require 'test_helper'

describe SlackApiWrapper do
  describe "Testing self.listChannels()"
  it "Can get a list of channels" do
    VCR.use_cassette("slack") do

      channels =
      SlackApiWrapper.listChannel()

      channels.must_be_instance_of Array
      #channels.class.must_equal array
      channels.each do |channel|
        channel.must_be_instance_of Channel
      end
    end

  end

  it "returns an empty array with a bad token" do
    VCR.use_cassette("slack") do

      channels = SlackApiWrapper.listChannels("Bad token")
      channels.must_equal []

    end
  end


  describe "Get a channel do"
  it "Can get a channel given a valid channel id" do

  end

  it "returns false for an invalid channel" do

  end
end

describe "Send message" do

  it "Can send a message to a valid channel" do

  end

  it "Returns false when sending a message fails" do

  end

  it "requires a channel and a message" do

  end
end
