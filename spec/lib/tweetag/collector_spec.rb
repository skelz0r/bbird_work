require 'spec_helper'

describe Tweetag::Collector do
  before(:each) do
    @db_length = Tweet.count
    @retriever = Tweetag::Collector.new("z0zard","bbird")  
    @nb_insert_success = @retriever.collect
  end

  describe "#collect" do
    it "inserts new tweets in the database" do
      expect(Tweet.count).to eq(@db_length+@nb_insert_success)
    end


    # au final j'aimerai bien que ça se fasse avec les id ça lololol

    it "tweets from the account of our db-users" do
      Tweet.all.each do |received_tweet|
        expect(@retriever.preset_account).to eq(received_tweet.user.login_twitter)
      end
    end

    it "tweets with the hashtag we want" do 
      Tweet.all.each do |received_tweet|
        expect(received_tweet.text).to include("##{@retriever.preset_hashtag}")
      end
    end
  end
end


