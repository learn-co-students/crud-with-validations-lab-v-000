require 'pry'

class SongsController < ApplicationController


  def index
    @songs = Song.all
  end


  def new
    @song = Song.new
  end


  def create
    @song = Song.new(song_params)
    if @song.save
       redirect_to song_path(@song)
     else
       render :new
     end
   end


   def edit
     @song = Song.find(params[:id])
   end

   def update
     @song = Song.find(params[:id])
     @song = Song.update(song_params)
     if @song.valid?
       @song.save
       redirect_to song_path(@song)

     else
       render :edit
     end
   end



   private


   def song_params(*args)
     params.require(:song).permit(*args)
   end
end
