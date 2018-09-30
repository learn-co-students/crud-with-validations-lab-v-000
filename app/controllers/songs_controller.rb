class SongsController < ApplicationController

	before_action :find_song!, only: [:show, :edit, :update]

	def index
		@songs = Song.all
	end

	def new
		@song = Song.new
	end

	def create
		@song = Song.new(song_params)
		if @song.save
			redirect_to song_path(@song.id)
		else
			render :new
		end
	end

	def show 
	end

	def edit	
	end

	def update
		  if @song.update_attributes(song_params)
			redirect_to song_path(@song.id)
		else
			render :edit
		end
	end

	def destroy
		Song.find(params[:id]).destroy
		redirect_to songs_path
	end

	private

	def find_song!
		@song = Song.find(params[:id])
	end

	def song_params
		params.require(:song).permit(:title, :artist_name, :genre, :release_year, :released)
	end

end
