class Tweet < ActiveRecord::Base
  attr_accessible :author, :id_twitter, :text
  validates_uniqueness_of :id_twitter
  validates_presence_of :id_twitter
end
