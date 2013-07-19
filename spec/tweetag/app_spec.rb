require 'spec_helper'

describe Tweetag::Collector do

  before(:each) do
    @output = double('output').as_null_object
    @retriever = Tweetag::Collector.new(@output,"z0zard","bbird")  
    @retriever.collect
  end

  describe "#collect" do


    it "collects tweets from the accounts we set" do

      @retriever.results.each do |received_tweet|
        expect(@retriever.preset_account).to eq(received_tweet.author)

      end
    end

    it "collects tweets with the hashtag we want" do 

      @retriever.results.each do |received_tweet|
        expect(received_tweet.text).to include("##{@retriever.preset_hashtag}")

      end
    end

    it "inserts tweets in the database" do

      tweets_id = @retriever.twitter_ids_in_db
      @retriever.results.each do |received_tweet|
        expect(tweets_id).to include(received_tweet.id) 
      
      end
    end

  end

  describe "#print" do
    it "displays tweets properly" do

      @retriever.results.each do
        @output.should_receive(:puts).with('Author :')
        @output.should_receive(:puts).with('Tweet :')
      end

      @retriever.print

    end
  end

end


