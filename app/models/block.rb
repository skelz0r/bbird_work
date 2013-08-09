class Block < ActiveRecord::Base
  attr_accessible :content, :id_case, :canvas_id

  validates_presence_of :id_case

  belongs_to :canvas
end
