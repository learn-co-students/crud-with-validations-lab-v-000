class SongsController < ApplicationController
  before_action :find_song, only: [:show, :edit, :update]

  def index
    @songs = Song.all
  end

  def show
    #@song = Song.find(params[:id])
  end

  def edit
    #@song = Song.find(params[:id])
  end

  def update
    #@song = Song.find(params[:id])

    if @song.update(params_check(:title, :artist_name, :release_year, :released, :genre))
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(params_check(:title, :artist_name, :release_year, :released, :genre))

    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def destroy
    #binding.pry
    @song = Song.find(params[:id]).destroy
    redirect_to songs_path
  end

  private

  def params_check(*args)
    params.require(:song).permit(*args)
  end

  def find_song
    @song = Song.find(params[:id])
  end
end
