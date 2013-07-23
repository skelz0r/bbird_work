class Tweetag::Collector

  attr_accessor :preset_account, :preset_hashtag

  def initialize(preset_account, preset_hashtag)

    @preset_account = preset_account
    @preset_hashtag = preset_hashtag

    # définition des credentials

    Twitter.configure do |config|
      config.consumer_key = "KgdRthRd0H1LvTcYMxBxJQ"
      config.consumer_secret = "dQGaEcbPPIbnM4On6eyHNrYwp1lEPGv8vM3RlxLt8" 
      config.oauth_token = "90441345-JEcCGq1OnBaAl5sNzdN2diHk1vgtLvWoKDWbXV54e" 
      config.oauth_token_secret = "YlvawOP9bAI979qBRusPStWHYvg1oQh5tF57sAfHo" 
    end
  end

  def collect

    tweets_info = Twitter.search("##{@preset_hashtag} from:#{@preset_account}}", :result_type => "recent").statuses

    tweets_info.each do |tweet|
      Tweet.create(text: tweet.text, author: tweet.from_user, id_twitter: tweet.id)
    end

    return tweets_info.length

  end
end




