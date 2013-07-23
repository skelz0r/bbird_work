require 'spec_helper'

describe Tweetag::Collector do
  before(:each) do
    @db_length = Tweet.count
    @retriever = Tweetag::Collector.new("z0zard","bbird")  
    @nb_insert_success = @retriever.collect
  end

  describe "#collect" do
    it "inserts tweets in the database" do
      expect(Tweet.count).to eq(@db_length+@nb_insert_success)
    end

    it "collects tweets from the accounts we set" do
      Tweet.all.each do |received_tweet|
        expect(@retriever.preset_account).to eq(received_tweet.author)
      end
    end

    it "collects tweets with the hashtag we want" do 
      Tweet.all.each do |received_tweet|
        expect(received_tweet.text).to include("##{@retriever.preset_hashtag}")
      end
    end
  end
end


