class SongsController < ApplicationController

  def index
     @songs = Song.all
   end

   def show
     @song = find_by_id
   end

   def new
     @song = Song.new
   end

   def create
     @song = Song.create(song_params)
     if @song.save
       redirect_to song_path(@song)
     else
       render :new
     end
   end

   def edit
     @song = find_by_id
   end

   def update
     @song = find_by_id
     if @song.update(song_params)
       redirect_to song_path(@song)
     else
       render :edit
     end
   end

   def destroy
     find_by_id.destroy
     redirect_to songs_path
   end

 private

   def song_params
      params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
   end

   def find_by_id
     Song.find(params[:id])
   end

end
