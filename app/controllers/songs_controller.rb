class SongsController < ApplicationController
  # before_action :set_song!

  def index
    @songs = Song.all
  end

  def show
  end

  def edit
  end

  def update
    if @song.update(song_params)
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  private

  def song_params
    params.permit(:title, :released, :artist_name)
  end

  def set_song!
    @song = Song.find(params[:id])
  end

end
