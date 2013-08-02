require 'spec_helper'

describe Tweet do

  before(:each) do
    @attr_user = { name: "me", mail: "me@gmail.com", login_twitter: "thisisme" }
    @attr = {user: User.new(@attr_user), id_twitter: 1000, text: "hello" }
  end

  it "must be valid" do
    Tweet.new(@attr).should be_valid
  end

  describe "#author" do
    it "is not valid if it has no author" do
      @attr[:user]=nil
      Tweet.new(@attr).should_not be_valid
    end
  end

  describe "#id_twitter" do
    it "is not valid if its twitter id is already in db" do 
      Tweet.create(@attr)
      Tweet.new(@attr).should_not be_valid
    end

    it "is not valid if it has no twitter id" do
      @attr[:id_twitter]=nil
      Tweet.new(@attr).should_not be_valid
    end
  end
end
