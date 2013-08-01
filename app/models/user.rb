class User < ActiveRecord::Base
  attr_accessible :mail, :name, :id_twitter, :login_twitter
  has_many :tweets
  validates_uniqueness_of :id_twitter
  validates_presence_of :name
end
