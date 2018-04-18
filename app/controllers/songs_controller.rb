class SongsController < ApplicationController
	before_action :set_song!, only: [:show, :edit, :update, :destroy]

	def new
		@song = Song.new
	end

	def index
		@songs = Song.all
	end

	def show
		@song = Song.find(params[:id])
	end

	def edit
	end

	def update
		@song.update(song_params)
		if @song.valid?
			@song.save
			redirect_to song_path(@song)
		else
			render :edit
		end
	end

	def create
		@song = Song.new(song_params)
		if @song.valid?
			@song.save
			redirect_to song_path(@song)
		else
			render :new
		end
	end

	def destroy
		@song.destroy
		redirect_to songs_url
	end


	private
		def set_song!
			@song = Song.find(params[:id])
		end

		def song_params
			params.require(:song).permit(:title, :release_year, :released, :genre, :artist_name)
		end



end
