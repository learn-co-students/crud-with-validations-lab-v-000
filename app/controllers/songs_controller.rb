class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def show
    find_current_song
  end

  def edit
    find_current_song  
  end

  def update
    find_current_song
    @song.update(song_params)
      if @song.valid?
        redirect_to song_path(@song)
      else
        render :edit
      end
  end

  def create
    @song = Song.new(song_params)    
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def new
    @song = Song.new
  end

  def destroy
    find_current_song
    @song.destroy

    redirect_to songs_url
  end




  private

  def find_current_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
  end
end
