class User < ActiveRecord::Base
  attr_accessible :mail, :name, :id_twitter, :login_twitter
  has_many :tweets
  validates_uniqueness_of :id_twitter
  validates_presence_of :name

  def self.all_id_twitter
    ids_twitter=Array.new
    User.all.each do |user|
      ids_twitter << user.id_twitter if not user.id_twitter.nil?
    end
    return ids_twitter
  end

end
