require 'spec_helper'

describe User do

  before(:each) do
    @attr = {name: "me", id_twitter: 1000, mail: "me@gmail.com", login_twitter: "thisisme" }
  end

  it "must be valid" do
    User.new(@attr).should be_valid
  end

  describe "#name" do

    it "is not valid if it has no name" do
      @attr[:name]=nil
      User.new(@attr).should_not be_valid
    end
  end

  describe "#id_twitter" do

    it "is not valid if twitter id already in db" do
      User.create(@attr)
      User.new(@attr).should_not be_valid
    end
  end

  describe "#all_id_twitter" do
    it "returns twitter_ids of users having twitter accounts" do
      User.create(@attr) # id_twitter vaut 1000
      @attr[:id_twitter]=2000
      User.create(@attr) 
      @attr[:id_twitter]=nil
      User.create(@attr)
      User.all_id_twitter.should eq([1000,2000])
    end
  end

end
