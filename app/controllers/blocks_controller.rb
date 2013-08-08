class BlocksController < ApplicationController
  def update
    b=Block.find_by_id_case(params[:block][:id_case]) 
    b.content=params[:block][:content]
    b.save
    redirect_to canvas_path
  end
end
