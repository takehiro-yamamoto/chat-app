class RoomsController < ApplicationController
  def  new
    @room = Room.new
  end
  
  def create
    @room = Room.new(room_params)
    if @room.save
      @room.user_ids = params[:room][:user_ids].reject(&:blank?)
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  private

  def room_params
    params.require(:room).permit(:name, user_ids: [])
  end
end
