class SongsController < ApplicationController
  def show
  end

  def index
  end

  def new
  end

  def edit
  end

  private

  def song_param
    params.require(:song)
  end

  def current_song
    @song = Song.find_by(id: params[:id])
  end
end
