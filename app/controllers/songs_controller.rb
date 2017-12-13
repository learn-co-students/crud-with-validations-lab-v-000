class SongsController < ApplicationController
   before_action :set_song!, only: [:show, :edit, :update]

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

   def show
   end

   def index
     @songs = Song.all
   end

   def edit
   end

  def update
    @song.update(song_params)
    if @song.valid?
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
    Song.find(params[:id]).destroy
    redirect_to songs_path
  end

   def set_song!
     @song = Song.find(params[:id])
   end

 private

 def song_params
   params.require(:song).permit(:title, :artist_name, :genre, :released, :release_year)
 end
end
