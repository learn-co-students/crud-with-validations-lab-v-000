class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def show
    set_song
  end

  def new
		@song = Song.new
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

  def edit
    set_song
  end

  



  private

  def song_params
    params.require(:song).permit(:title, :artist_name, :released)
  end

  def set_song
    @song = Song.find(params[:id])
  end

end
