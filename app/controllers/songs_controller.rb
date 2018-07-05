class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(pass_params)
    if @song.save
      redirect_to @song
    else
      render :new
    end
  end
  
  def show
    set_song!
  end

  def edit
    set_song!
  end

  def update
    set_song!
    if @song.update(pass_params)
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    Song.find(params[:id]).destroy
    redirect_to songs_path
  end

  private

  def set_song!
    @song = Song.find(params[:id])
  end

  def pass_params
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
  end
end
