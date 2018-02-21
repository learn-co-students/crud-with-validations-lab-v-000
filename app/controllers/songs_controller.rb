class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def show
    @song = song_finder
  end

  def create
    @song = Song.create(song_params)
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else 
      render :new
    end
  end

  def edit
    @song = song_finder
  end

  def update
    @song = song_finder
    if @song.update(song_params)
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
    @song = song_finder
    @song.destroy
    redirect_to songs_url
  end

  private 

  def song_finder 
    Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:title, :release_year, :released, :artist_name, :genre)
  end

end
