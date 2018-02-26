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
    @song = Song.create(song_params)
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
    @song = Song.find(params[:id])
      if @song.update(song_params)
        redirect_to song_path(@song)
      else
        render :edit
     end
  end

  def destroy
    Song.find(params[:id]).destroy
    flash[:success] = "Song deleted"
    redirect_to songs_path
  end


  private

  def song_params
     params.require(:song).permit(
        :title, :release_year, :released, :genre, :artist_name
      )
   end

   def set_song
     @song = Song.find(params[:id])
   end

end
