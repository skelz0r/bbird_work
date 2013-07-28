require 'tweetag'

class TweetController < ApplicationController
  def print
    @retriever=Tweetag::Collector.new("z0zard","bbird")
    @retriever.collect
    @tweets=Tweet.all
  end
end
