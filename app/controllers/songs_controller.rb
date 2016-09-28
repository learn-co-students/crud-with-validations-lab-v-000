require 'pry'
class SongsController < ApplicationController

  def index
    @songs = Song.all 
  end

  def show
    find_song
    render :show
  end

  def new
    @song = Song.new
  end  

  def edit
    find_song
  end

  def create
    @song = Song.new
    @song.title = params[:song][:title]
    @song.released = params[:song][:released]
    @song.release_year = params[:song][:release_year]
    @song.artist_name = params[:song][:artist_name]
    @song.genre = params[:song][:genre]
    if @song.save
      redirect_to song_path(@song)
    else 
      render :new
    end
  end
 
  def update
    find_song 
    @song.title = params[:song][:title]
    @song.released = params[:song][:released]
    @song.release_year = params[:song][:release_year]
    @song.artist_name = params[:song][:artist_name]
    @song.genre = params[:song][:genre]
    if @song.save
      redirect_to song_path(@song)
    else
      render :edit
    end
  end     
  
  def destroy
    Song.find(params[:id]).destroy
    redirect_to songs_path
  end
# from 'solution'
#   def destroy
#     @song = Song.find(params[:id])
#     @song.destroy
# binding.pry
#     redirect_to songs_url
#   end


  private
 
  def find_song
    @song = Song.find(params[:id])
  end

# from 'solution'
  # def song_params
  #   params.require(:song).permit(
  #     :title, :release_year, :released, :genre, :artist_name
  #   )
  # end
end
