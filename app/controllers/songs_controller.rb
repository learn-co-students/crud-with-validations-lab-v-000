class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def edit
    song_setter
  end

  def show
    song_setter
  end

  def create
    @song = Song.new(song_params(:title, :artist_name, :release_year, :released, :genre))
    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def update
    song_setter
    @song.update(song_params(:title, :artist_name, :release_year, :released, :genre))
    if @song.valid?
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
    song_setter
    @song.destroy
    redirect_to songs_path 
  end

  private

  def song_setter
    @song = Song.find(params[:id])
  end

  def song_params(*args)
    params.require(:song).permit(*args)
  end

end
