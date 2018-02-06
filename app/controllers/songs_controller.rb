class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    # binding.pry
    @song = Song.new(song_params)
    if @song.save

      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])

    if @song.update(song_params)
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id]).destroy
    redirect_to songs_url
  end

  private

    def song_params
      params[:song].permit(:title, :artist_name, :release_year, :genre, :released)
    end

end
