class SongsController < ApplicationController

  before_action :set_song, only: [:show, :edit, :update, :delete]

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def edit

  end

  def update

  end

  def delete
    @song.destroy
  end

  private

  def set_song
    @song = Song.find_by_id(params[:id])
  end

  def song_params
    params.require(:song).permit!
  end


end
