class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def show
    @song = Song.find_by(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.create(song_params)
  end

  def edit
  end

  def update
  end

  def delete
  end

end
