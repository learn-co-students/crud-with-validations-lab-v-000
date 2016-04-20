class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(params.require(:song).permit(:title, :release_year, :released, :genre, :artist_name))
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
    if @song.update(params.require(:song).permit(:title, :release_year, :released, :genre, :artist_name))
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id])
    if @song.destroy
      redirect_to songs_url
    else
      redirect_to song_path(@song)
    end
  end
    else

end
