class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  def index
  	@songs = Song.all
  end

  def new
  	@song = Song.new
  end

  def create
    @song = Song.new(song_params(:title, :artist_name, :genre, :release_year, :released))
    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def destroy
  	@song.destroy
  	redirect_to songs_path
  end

  def update
    if @song.update(song_params(:title, :artist_name, :genre, :release_year, :released))
      @song.update(song_params(:title, :artist_name, :genre, :release_year, :released))
      redirect_to song_path(@song)
    else 
      render :edit
    end
  end

  private

  def song_params(*args)
    params.require(:song).permit(*args)
  end

  def set_song
    @song = Song.find(params[:id])
  end

end
