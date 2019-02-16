class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    # binding.pry
    @song = Song.new(song_params(params[:song].keys))
    if @song.valid?
       @song.save
      #  render :show
      redirect_to song_path(@song)
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
    # want to find the song instance with params, and update it. but it should be validated
    # and protected by strong params
    @song = Song.find(params[:id])
    if @song.valid?
      @song.update(song_params(params[:song].keys))
      # binding.pry
      redirect_to song_path(@song)
      # binding.pry
    else
      render :edit

      # render edit_song_path(@song)
    end

  end

  def delete

  end



private

  def song_params(*args)
    params.require(:song).permit(*args)
  end

end
