class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def show
    find_song
  end

  def create
    @song = Song.create(song_params)
    if @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def edit
    find_song
  end

  def update
    find_song
    if @song
      @song.update(song_params)
      if @song.save
        redirect_to @song
      else
        render :edit
      end
    else
      render :edit
    end
  end

  def destroy
    find_song.destroy
    redirect_to songs_path
  end
  
  private

  def find_song
    @song = Song.find(params[:id])
  end

  def song_params
    params[:song].permit(:title, :released, :release_year, :artist_name, :genre)
  end

end
