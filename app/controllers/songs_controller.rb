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
    @song = Song.new(require_params(:title, :artist_name, :release_year, :released, :genre))
    if @song.valid?
      @song.save
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
    if @song.update(require_params(:title, :artist_name, :release_year, :released, :genre))
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def require_params(*args)
    params.require(:song).permit(*args)
  end

  def destroy
    Song.find(params[:id]).destroy
    redirect_to songs_url
  end

end
