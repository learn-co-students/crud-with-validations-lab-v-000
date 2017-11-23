class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def show
    @song = Song.find_by(id: params[:id])
  end

  def create
    @song = Song.new(song_params(:title, :release_year, :artist_name, :genre, :released))
    if @song.valid?
      @song.save
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
    # binding.pry

    if @song.update(song_params(:title, :released, :release_year, :artist_name, :genre))
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
    Song.find_by(id: params[:id]).destroy
    redirect_to songs_url
  end

  private

  def song_params(*args)
    params.require(:song).permit(*args)
  end
end
