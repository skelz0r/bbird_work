require 'spec_helper'

describe User do

  before(:each) do
    @attr = {name: "me", id_twitter: 1000, mail: "me@gmail.com", login_twitter: "thisisme" }
  end

  it "must be valid" do
    user = User.new(@attr)
    user.should be_valid
  end

  describe "#name" do

    it "is not valid if it has no name" do
      @attr[:name]=nil
      user = User.new(@attr)
      user.should_not be_valid
    end
  end

  describe "#id_twitter" do

    it "is not valid if twitter id already in db" do
      User.create(@attr)
      user = User.new(@attr)
      user.should_not be_valid
    end
  end
end
