require 'spec_helper'

describe User do

  before(:each) do
    @attr = {name: "me", mail: "me@gmail.com", login_twitter: "one" }
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

    it "is not valid if twitter login already in db" do
      User.create(@attr)
      User.new(@attr).should_not be_valid
    end
  end

  describe "#all_twitter_login" do
    it "returns twitter logins of users having twitter accounts" do
      User.create(@attr) # login_twitter = one
      @attr[:login_twitter]="two"
      User.create(@attr) 
      @attr[:login_twitter]=nil
      User.create(@attr)
      User.all_twitter_login.should eq(["one","two"])
    end
  end

end
