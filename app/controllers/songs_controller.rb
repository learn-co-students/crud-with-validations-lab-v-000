class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]
  
	def index
		@songs = Song.all
	end
  
	def new
		@song = Song.new
	end

  def create
    @song = Song.new(song_params)

    if @song.save
      
      redirect_to @song
    else
      render :new
    end
  end
	
	def show
	end
	
	def edit
	end
	
  def update
    if @song.update(song_params)
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
	
	def set_song
		@song = Song.find(params[:id])
	end

  def song_params
    params.require(:song).permit(
      :title, :release_year, :released, :genre, :artist_name
    )
  end
end



