class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def show
    set_song
  end

  def edit
    set_song
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_class_params)
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :new
    end

    def update
      if set_song.update(song_class_params)
        set_song.save
        redirect_to song_path(set_song)
      else
        render :edit
      end
    end

    def destroy
      set_song.destroy
      redirect_to songs_path
    end

  end

  private
    def set_song
      @song = Song.find(params[:id])
    end

    def song_class_params
      params.require(:song).permit(:title, :artist_name, :release_year, :released, :genre)
    end

end
