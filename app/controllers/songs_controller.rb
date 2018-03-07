class SongsController < ApplicationController

	def new
		@song = Song.new
	end

	def show
		@song = Song.find(params[:id])
	end

	def create
		@song = Song.new(post_params)

		if @song.valid?

			redirect_to song_path(@song)
		else

			render :new
		end
	end

	def index
		@songs = Song.all
	end

	def edit
		@song = Song.find(params[:id])
	end

	def update
		@song = Song.find(params[:id])

		if @song.update

			redirect_to song_path(@song)
		else

			render :edit
		end
	end

	def destroy
	  @song = Song.find(params[:id])
	  @song.destroy
	
	  redirect_to songs_url
	end

	private

	def song_params
	  params.require(:song).permit(
	    :title, :release_year, :released, :genre, :artist_name
	  )
	end
end
