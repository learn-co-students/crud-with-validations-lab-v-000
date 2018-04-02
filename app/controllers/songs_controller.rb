class SongsController < ApplicationController
   
  def index
    @songs = Song.all
  end
  def show
    find_song
  end
  def new
    @song = Song.new
  end
  def create
    @song = Song.new(songs_params(:title,:released,:artist_name,:release_year,:genre))
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :new
    end

  end
  def update
    find_song
    @song.update(songs_params(:title,:released,:artist_name,:release_year,:genre))
    if @song.valid?
      redirect_to song_path(@song)
    else
      render :edit
    end
  end
  def edit
    find_song
  end
  def destroy
    find_song.destroy
    redirect_to songs_path
  end
  private
    def songs_params(*args)
      params.require(:song).permit(*args)
    end
    def find_song
      @song = Song.find(params[:id])
    end
end
