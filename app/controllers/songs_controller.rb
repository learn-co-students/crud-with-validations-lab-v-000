class SongsController < ApplicationController

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    # binding.pry
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
    @song.attributes = song_params
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def index
    @songs = Song.all
    # binding.pry
  end

  def show
    @song = Song.find(params[:id])
  end

  def destroy
    @song = Song.find(params[:id]).destroy
    redirect_to songs_path
  end

  private

  def song_params
    params[:song].permit(:title, :released, :release_year, :artist_name, :genre)
  end
end
