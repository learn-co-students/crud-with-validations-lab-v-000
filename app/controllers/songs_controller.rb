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
    @song = Song.new(song_params(:title, :released, :release_year, :artist_name, :genre))

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
  
  def update
    set_song

    if @song.update(song_params(:title, :released, :release_year, :artist_name, :genre))
      redirect_to song_path(@song)
    else
      render :edit
    end
    
    def destroy
      set_song.destroy
      redirect_to songs_path
    end
    
  end

  private

  def set_song
    @song = Song.find(params[:id])
  end
  
  def song_params(*args)
    params.require(:song).permit(*args)
  end
  
end
