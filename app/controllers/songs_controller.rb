class SongsController < ApplicationController
 before_action :set_song, only: :show

  def new
    @song = Song.new
  end

  def create
    @song = Song.new
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def show

  end

  def index
    @songs = Song.all
  end

  private

  def set_song
    @song = Song.find(params[:id])
  end
end
