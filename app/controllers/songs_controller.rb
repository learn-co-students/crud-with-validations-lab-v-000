class SongsController < ApplicationController
	def index
		@songs = Song.all
	end

	def show
		@song = Song.find_by_id(params[:id])
	end

	def new
		@song = Song.new
	end
   
	def edit
		@song = Song.find_by_id(params[:id])
	end
    
    def create
    	@song = Song.create(song_params(:title, :artist_name, :release_year, :released, :genre))
    	if @song.valid?
    		redirect_to song_path(@song.id)
    	else
    		render :new
    	end
    end

	def update
		# binding.pry
		@song = Song.find_by_id(params[:id])
		@song.update(song_params(:title, :artist_name, :release_year, :released, :genre))
		if @song.valid?
			redirect_to song_path(@song.id)
		else
			render :edit
		end
	end

	def destroy
		@song = Song.find_by_id(params[:id])
		@song.destroy
		redirect_to songs_path
	end

	private

	def song_params(*args)
		params.require(:song).permit(*args)
	end

end
