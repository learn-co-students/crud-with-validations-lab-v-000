class SongsController < ApplicationController
	def index
		@songs = Song.all
	end

	def show
		find_song
	end

	def new
		@song = Song.new
	end

	def create
		@song = Song.new(post_params)

		if @song.valid?
			@song.save
			redirect_to song_path(@song)
		else
			render :new
		end
	end

	def edit
		find_song
	end

	def update
		find_song
		if @song.update(post_params)
			redirect_to song_path(@song)
		else
			render :edit
		end
	end

	def destroy
		Song.find(params[:id]).destroy
		redirect_to songs_url
	end

	private

	def find_song
		@song = Song.find(params[:id])
	end

	def post_params
		params.require(:song).permit(:title, :artist_name, :genre, :release_year, :released)
	end

end
