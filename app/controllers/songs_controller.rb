# require 'pry'

class SongsController < ApplicationController

  def index
    @songs = Song.all


  def show
    @song = Song.find(params[:id])
    # binding.pry
  end

end
