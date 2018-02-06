class SongsController < ApplicationController
	def index
		@songs = Song.all
	end

	def show
		@song = find_song
	end

	def new
		@song = Song.new()
	end

	def create
		@song = Song.new(params_helper)
		if @song.save
			redirect_to song_url(@song)
		else
			render :new
		end
	end

	def update
		@song = find_song
		if @song.update(params_helper)
			redirect_to song_url(@song)
		else
			render :edit
		end

	end

	def edit
		@song = find_song
	end

	def destroy
		find_song.destroy
		redirect_to songs_url
	end

	private

		def find_song
			Song.find(params[:id])
		end

		def params_helper
			params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
		end


end
