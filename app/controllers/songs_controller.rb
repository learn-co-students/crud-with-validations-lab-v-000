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
  
  def edit
    set_song
  end
  
  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to @song
    else
      render :new
    end
  end
  
  def update
    if set_song.update(song_params)
      redirect_to set_song
    else
      render :edit
    end
  end
  
  def destroy
    if set_song.destroy
      redirect_to songs_path
    else
      render :show
    end
  end
    
  
  private
  
  def set_song
    @song = Song.find(params[:id])
  end
  
  def song_params(*args)
    params.require(:song).permit(:title, :artist_name, :released, :release_year, :genre)
  end
end
