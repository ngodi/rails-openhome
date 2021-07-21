class PhotosController < ApplicationController
  
    def destroy
      @image = Image.find(params[:id])
      room = @image.room

      @image.destroy
      @image = Image.where(room_id: room.id)

      respond_to :js
    end
end