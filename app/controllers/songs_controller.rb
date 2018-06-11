class SongsController < ApplicationController

  def index 
    @songs = Song.all
  end 

  def show 
    @song = Song.find(params[:id])
  end 

  def edit 
    @song = Song.find(params[:id])
  end 

  def update 
  end 


end
