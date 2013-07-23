require 'spec_helper'

describe Tweet do
  describe "#id_twitter" do
    it "is not valid if its twitter_id is already in db" do 
      
      tweet = Tweet.create(id_twitter: 1000)
      tweet = Tweet.create(id_twitter: 1000)

      tweet.should_not be_valid

    end
  end
end
