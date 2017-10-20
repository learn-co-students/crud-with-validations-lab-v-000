class SongsController < ApplicationController
  
  before_action :song_setter, only: [:show, :edit, :update, :delete]

  def index
    @songs = Song.all
  end

  def show
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.valid?
      @song.save
      redirect_to song_path(song)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @song.attributes = song_params
    if @song.valid?
      redirect_to song_path
    else
      render :new
    end
  end

  def delete
    @song.destroy
    redirect_to songs_path
  end


  private

  def song_params
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
  end

  def song_setter
    @song = Song.find(params[:id])
  end

end
