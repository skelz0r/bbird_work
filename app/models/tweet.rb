class Tweet < ActiveRecord::Base
  attr_accessible :author, :id_twitter, :text
end
