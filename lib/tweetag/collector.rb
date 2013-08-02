class Tweetag::Collector

  attr_accessor :preset_account, :preset_hashtag

  def initialize(preset_account, preset_hashtag)
    @preset_account = User.all_twitter_login 
    @preset_hashtag = preset_hashtag
  end

  def collect
    valid_tweets=0

    @preset_account.each do |account|
      tweets_info = Twitter.search("##{@preset_hashtag} from:#{account}}").statuses
      tweets_info.each do |tweet|
        u=User.find_by_login_twitter(tweet.from_user)
        t=Tweet.new(text: tweet.text, user: u, id_twitter: tweet.id)
        valid_tweets+=1 if t.save
      end
    end
    return valid_tweets
  end
end

