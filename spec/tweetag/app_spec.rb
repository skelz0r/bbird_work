require 'spec_helper'

describe Tweetag::Collector do

  before(:each) do
    @output = double('output').as_null_object
    @retriever = Tweetag::Collector.new(@output,"z0zard","bbird")  
    @retriever.collect
  end

  describe "#collect" do


    it "collects tweets from the preset_accounts we set" do

      @retriever.results.each do |received_tweet|
        expect(@retriever.preset_account).to eq(received_tweet.author)
      end
    end

    it "collects tweets with the preset_hashtag we want" do 

      @retriever.results.each do |received_tweet|
        expect(received_tweet.text).to include("##{@retriever.preset_hashtag}")
      end
    end
  end


  describe "#print" do
    it "displays tweets properly" do

      @retriever.results.each do |received_tweet|
        @output.should_receive(:puts).with('Author :')
        @output.should_receive(:puts).with('Tweet :')
      end

      @retriever.print
    
    end
  end

end


