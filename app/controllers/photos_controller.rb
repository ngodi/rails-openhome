class PhotosController < ApplicationController
  
    def destroy
      @photo = Photo.find(params[:id])
      room = @photo.room

      @photo.destroy
      @photos = Photo.where(room_id: room.id)

      respond_to :js
    end

    def purge
      image = ActiveStorage::Attachment.find(params[:id])
      image.purge
      redirect_back fallback_location: root_path, notice: "success"
    end
end