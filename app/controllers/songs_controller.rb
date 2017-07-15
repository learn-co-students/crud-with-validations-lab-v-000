class SongsController < ApplicationController

  def index #GET
    @songs = Song.all
  end

  def new #GET
    @song = Song.new
  end

  def show #GET
    @song = Song.find(params[:id])
  end

  def edit #GET
    @song = Song.find(params[:id])
  end

  def create #POST
    @song = Song.new(params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre))
    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def update #PATCH
    @song = Song.find(params[:id])
    if @song.update(params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre))
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy #DELETE
    @song = Song.find(params[:id])
    @song.destroy
    redirect_to songs_path
  end

end
