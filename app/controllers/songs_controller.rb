class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.valid?
       @song.save
       render :show
    else
       render :new
    end
  end

  def show
    # binding.pry
    @song = Song.find_by(params[:id])
  end

  def edit
    @song = Song.find_by(params[:id])
  end

  def update
    
  end

  def delete

  end

private

  def song_params(*args)
    params.require(:song).permit(*args)
  end

end
