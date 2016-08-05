class SongsController < ApplicationController
  # Create
  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)

    if @song.save
      redirect_to @song
    else
      render :new
    end
  end

  # Read
  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  # Update
  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    if @song.update(song_params)
      redirect_to @song
    else
      render :edit
    end
  end

  # Destroy
  def destroy
    Song.find(params[:id]).destroy
    redirect_to songs_url
  end

  private

  def song_params
    params.require(:song).permit(
      :title, :released, :release_year, :artist_name, :genre
    )
  end
end
