class SongsController < ApplicationController

	def index
		@songs=Song.all 
	end

	def new
		@song=Song.new
	end

	def create
		@song=Song.new(song_params)

		if @song.save
			redirect_to song_path(@song)
		else
			render 'songs/new'
		end

	end

	def show 
		@song=Song.find(params[:id])
	end

	def edit 
		@song=Song.find(params[:id])
	end

	def update
		@song=Song.find(params[:id])
		@song.update(song_params)
		if @song.save
			redirect_to song_path(@song)
		else
			render 'songs/edit'
		end
	end

	def destroy
		Song.find(params[:id]).destroy
		redirect_to '/songs'
	end

	private

		def song_params
			params.require(:song).permit(:title, :released, :release_year, :artist_name, :gene)
		end

end
