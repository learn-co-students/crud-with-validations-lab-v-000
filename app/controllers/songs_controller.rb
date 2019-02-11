class SongsController < ApplicationController

  def index 
  end
  
  def new
    @song = Song.new
  end

  def show
    @song = Song.find(params[:id])
  end

  def create
    @song = Song.new(song_params)

    if @song.save 
      redirect_to song_path(@song)
    else
      render :new 
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    @song.update(song_params)

    if @song.save 
      redirect_to song_path(@song)
    else 
      render :edit
    end
  end

  def destroy
    Song.find(params[:id]).destroy
    redirect_to songs_path
  end

  def song_params
    params.require(:song).permit(:title, :artist_name, :released, :release_year, :genre )
  end

end
