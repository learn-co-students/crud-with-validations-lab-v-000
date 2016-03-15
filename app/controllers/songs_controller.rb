class SongsController < ApplicationController
    def index
      @songs = Song.all
    end
    
    def show
      set_song
    end
    
    def new 
      @song = Song.new
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
    
    def edit 
      set_song
    end
    
    def update
      set_song
      if  @song.update(song_params)
        @song.save
        redirect_to song_path(@song)
      else
        render :edit
      end
    end
    
    def destroy
      set_song.destroy
      redirect_to songs_path
    end
    
private
  def song_params
    params.require(:song).permit(:title, :artist_name, :released, :release_year, :genre)
  end

  def set_song
    @song = Song.find(params[:id])
  end
end
