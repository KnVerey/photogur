class PhotosController < ApplicationController

	def index
		@photos = Photo.all
	end

	def new
		@photo = Photo.new	
		@collections = Collection.all
	end

	def create
		@photo = Photo.new(photo_params)

		if @photo.save
			redirect_to photo_path(@photo)
		else
			render "new"
		end
	end

	def show
		@photo = Photo.find(params[:id])
	end

	def edit
		@photo = Photo.find(params[:id])
		@collections = Collection.all

	end

	def update
		@photo = Photo.find(params[:id])

		@photo.update_attributes(photo_params)

		if @photo.save
			redirect_to photo_path(@photo)
		else
			render "edit"
		end
	end

	def destroy
		@photo = Photo.find(params[:id])
		@photo.destroy
		redirect_to photos_url
	end

	private

	def photo_params
		params.require(:photo).permit(:artist, :title, :url, :collection_id)
	end
end
