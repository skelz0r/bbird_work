class Canvas < ActiveRecord::Base
  attr_accessible :title, :user

  belongs_to :user
  has_many :blocks

  after_create do
    9.times do |acc|
      Block.create(canvas_id: self.id, id_case: acc+1)
    end
  end

  validates_presence_of :user

end
