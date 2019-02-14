class SongsController < ApplicationController
	def index
		@songs = Song.all
	end

	def new
		@song = Song.new
	end

	def show
		@song = fetch_song
	end	

	def edit
		@song = fetch_song
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

	def update
		@song = fetch_song

		@song.update(song_params)

		if @song.valid?
			@song.save
			redirect_to song_path(@song)
		else
			render :edit
		end
	end

	def destroy
		@song = fetch_song

		@song.destroy

		redirect_to songs_url
	end

	private

	def fetch_song
		Song.find(params[:id])
	end

	def song_params
		params.require(:song).permit(:title, :artist_name, :released, :genre, :release_year)
	end
end
