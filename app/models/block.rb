class Block < ActiveRecord::Base
  attr_accessible :content, :id_case

  validates_presence_of :id_case
  validates_uniqueness_of :id_case
end
