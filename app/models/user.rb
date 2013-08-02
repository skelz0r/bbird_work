class User < ActiveRecord::Base
  attr_accessible :mail, :name, :login_twitter
  has_many :tweets
  validates_uniqueness_of :login_twitter
  validates_presence_of :name

  def self.all_twitter_login
    logins_twitter=Array.new
    User.all.each do |user|
      logins_twitter << user.login_twitter if user.login_twitter.present?
    end
    return logins_twitter
  end

end
