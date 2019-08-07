class SongsController < ApplicationController

def index
  @songs = Song.all
end

 def new
   @song = Song.new(song_params)
 end

  def show
    @song = Song.find(params[:id])
  end

  def edit
    @song = Song.find(params[:id])
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

end
