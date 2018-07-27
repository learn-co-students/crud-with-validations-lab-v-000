class SongsController < ApplicationController
   def index
    @songs = Song.all
  end
   def new
    @song = Song.new
  end
   def create
    @song = Song.new(song_params(:title, :release_year, :released, :genre, :artist_name))
      if @song.save
    	  redirect_to song_path(@song)
      else
        render "new"
      end
  end
   def show
    @song = Song.find(params[:id])
  end
   def edit
    @song = Song.find(params[:id])
  end
   def update
    @song = Song.find(params[:id])
    @song.update(song_params(:title, :release_year, :released, :genre, :artist_name))
    if @song.save
      redirect_to song_path(@song)
    else
      render "edit"
    end
  end
   def destroy
    @song = Song.find(params[:id])
    @song.destroy
    redirect_to songs_url
  end
   private
  def song_params(*args)
    params.require(:song).permit(*args)
  end
 end
