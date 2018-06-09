class SongsController < ApplicationController
  def new
  end

  def create
  end

  def update
    @song = Song.find(params[:id])
  end

  def destroy
  end

  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  private

  def song_params
  end
end
