class Canvas < ActiveRecord::Base
  attr_accessible :title, :user

  belongs_to :user
  has_many :blocks

  after_create do
    9.times do |acc|
      Block.create(canvas_id: self.id, id_case: acc+1, content: "content#{acc}")
    end
  end

  validates_presence_of :user

  def content_of_block(index)
    return Block.find_by_canvas_id_and_id_case(self.id,index).content  
  end

end
