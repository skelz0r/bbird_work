class CanvasController < ApplicationController
  
  before_filter :authenticate_user!
  
  def index
    @blocks=Array.new
    9.times do |acc|
      @blocks << Block.find_by_id_case(acc+1)
    end
  end
end
