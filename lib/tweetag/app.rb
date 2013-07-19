require 'twitter'
require 'tweet'

module Tweetag
  class Collector

    attr_accessor :preset_account, :preset_hashtag, :results

    def initialize(output, preset_account, preset_hashtag)

      @preset_account = preset_account
      @preset_hashtag = preset_hashtag

      @output = output

      @results = Array.new

      # définition des credentials

      Twitter.configure do |config|
        config.consumer_key = "KgdRthRd0H1LvTcYMxBxJQ"
        config.consumer_secret = "dQGaEcbPPIbnM4On6eyHNrYwp1lEPGv8vM3RlxLt8" 
        config.oauth_token = "90441345-JEcCGq1OnBaAl5sNzdN2diHk1vgtLvWoKDWbXV54e" 
        config.oauth_token_secret = "YlvawOP9bAI979qBRusPStWHYvg1oQh5tF57sAfHo" 
      end
    end

    def collect

      # faisons la requete 
      query = Twitter.search("##{@preset_hashtag} from:#{@preset_account}}", :result_type => "recent")


      tweets_info=query.statuses


      tweets_info.each do |tweet|
        r = Result.new
        r.text = tweet.text
        r.author = tweet.from_user
        r.id = tweet.id
        @results << r
      end

      @results.each do |res|
        t = Tweet.new
        t.author = res.author
        t.text = res.text
        t.id_twitter = res.id
        t.save
      end

    end

    def print

      tweets_db = Tweet.new
      tweets_db = Tweet.all
      @results = Array.new

      tweets_db.each do |tweet|
        r = Result.new
        r.author = tweet.author
        r.text = tweet.text
        r.id = tweet.id_twitter
        @results << r
      end

      @results.each do |tweet|
        @output.puts('Author :')
        @output.puts tweet.author
        @output.puts('Tweet :')
        @output.puts tweet.text
      end

    end

    def twitter_ids_in_db

      tweets_in_db = Tweet.all
      all_ids = Array.new

      tweets_in_db.each do |tweet|
        all_ids << tweet.id_twitter
      end

      return all_ids


    end

  end

end

class Result

  attr_accessor :author, :text, :id

  def initialize
  end


end

