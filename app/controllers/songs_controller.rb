class SongsController < ApplicationController

  def new
    @song = Song.new
  end

  def index
    @song = Song.all
  end

  def create
    @song = Song.find(params[:id])
    if @song.valid?
      @song.save

      redirect_to song_path(@song)
    else

      render :new
    end
  end

  def update
    @song = Song.find(params[:id])
    @song.update(song_params)

  if @song.valid?
    @song.save
    redirect_to song_path(@song)
  else
    render :edit
  end
end

  def destroy
    Song.find(params[:id]).destroy
    redirect_to songs_path
  end

private

  def song_params
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
  end
end
