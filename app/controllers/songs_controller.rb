class SongsController < ApplicationController
	def index
		@songs = Song.all
	end

	def show
		@song = Song.find_by_id(params[:id])
	end

	def edit	
		@song = Song.find_by_id(params[:id])
	end

	def create
		@song = Song.new(song_params(:title, :artist_name, :released, :release_year, :genre))

		if @song.save
			redirect_to song_path(@song)
		else
			render :new
		end
	end
	
	def new
		@song = Song.new
	end

	def update
		@song = Song.find_by_id(params[:id])
		if @song.update(song_params(:title, :artist_name, :released, :release_year, :genre))
			redirect_to song_path(@song)
		else
			render :edit
		end
	end

	def destroy
		Song.find_by_id(params[:id]).delete
		redirect_to songs_path
	end	
private

	def song_params(*args)
		params.require(:song).permit(*args)
	end

end
