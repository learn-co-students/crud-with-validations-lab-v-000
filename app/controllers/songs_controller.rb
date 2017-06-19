class SongsController < ApplicationController

	def index
		@songs = Song.all
	end

	def create
		@song = Song.new(song_params(params[:song].keys))

		if @song.valid?
			@song.save

			redirect_to song_path(@song)
		else
			render :new
		end
	end

	def new
		@song = Song.new
	end

	def show
		song
	end

	def edit
		song
	end

	def update
		song

		@song.update(song_params(params[:song].keys))

		if @song.valid?
			@song.save
			redirect_to song_path(@song)
		else
			render :edit
		end
	end

	def destroy
		song.destroy
		redirect_to songs_path
	end

	private 

		def song
			@song = Song.find_by(id: params[:id])
		end

		def song_params(*arg)
			params.require(:song).permit(*arg)
		end
end
