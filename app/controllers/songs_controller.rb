require 'pry'
class SongsController < ApplicationController
  def new
    @song = Song.new
  end

  def create
    binding.pry
    @song = Song.new(song_params)

    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def edit
  end

  def update
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
    params.require(:song)
  end
end
