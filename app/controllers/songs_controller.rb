class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def show
    @song = Song.find_by(id: params[:id])
  end

  def new
  end

  def create
    @song = Song.create(params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre))
    if @song.valid?
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def edit
    @song = Song.find_by(id: params[:id])
  end

  def update
    @song = Song.find_by(id: params[:id])
    @song.update(params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre))

    if @song.valid?
      redirect_to song_path(@song)
    else
      render :edit
    end

  end

  def destroy
    @song = Song.find_by(id: params[:id])
    @song.destroy
    redirect_to songs_path
  end


end
