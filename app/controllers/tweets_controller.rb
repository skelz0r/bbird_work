require 'tweetag'

class TweetsController < ApplicationController
  def index 
    @retriever=Tweetag::Collector.new("z0zard","bbird")
    @retriever.collect
    @tweets=Tweet.all
  end
end
