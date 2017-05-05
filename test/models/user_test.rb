require "test_helper"

describe User do

  it "must be valid with provider and uid" do
    user = User.create(provider: "provider", uid: "uid")
    user.must_be_instance_of User

  end

  it "must fail without uid" do
      user = User.new(provider: "provider")
      user.save.must_equal false
  end

  it "must fail without provider" do
    user = User.new(uid: "uid")
    user.save.must_equal false
  end

  it "uid must be unique" do
    user1 = User.create(provider: "provider", uid: "1")
    user2 = User.new(provider: "provider", uid: "1")
    user2.save.must_equal false
  end

  it "must have attributes" do
    user = User.create(provider: "provider", uid: "uid")
    user.provider.must_equal "provider"
    user.uid.must_equal "uid"
  end
end
