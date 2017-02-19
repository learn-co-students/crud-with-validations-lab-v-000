class SongsController < ApplicationController

	before_action :set_song, only: [:show, :edit, :update, :destroy]

	def index
		@songs = Song.all
	end

	def new
		@song = Song.new
	end

	def create
		@song = Song.new(params_for_song)
		if @song.save
			redirect_to song_path(@song)
		else
			render :new
		end
	end

	def edit

	end

	def show

	end

	def update
		if @song.update(params_for_song)
			redirect_to song_path(@song)
		else
			render :edit
		end
	end

	def destroy 
		@song.destroy
		redirect_to songs_path
	end

	private

	def params_for_song
		params.require(:song).permit(:title, :release_year, :artist_name, :genre)
	end

	def set_song
		@song = Song.find(params[:id])
	end

end
