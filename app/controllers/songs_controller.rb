class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song
      @song.save
      redirect_to song_path(@song.id)
    else
      render :new
    end
  end

  def show
    @song = Song.find(params[:id])
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song.update(song_params)
    if @song
      redirect_to song_path(@song.id)
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def song_params
    params.permit(:title, :release_year, :released, :genre, :artist_name)
  end
end
