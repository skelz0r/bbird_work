class BlocksController < ApplicationController
  def update
    b=Block.find_by_id_case_and_canvas_id(params[:block][:id_case], params[:block][:canvas_id]) 
    b.update_attributes(params[:block])
    redirect_to "/canvas/"+b.canvas_id.to_s
  end
end
