class SongsController < ApplicationController

  def new
    @song = Song.new
  end

  def index

  end

  def create
    @song = Song.find(params[:id])
  end

  def edit
    @song = Song.find(params[:id])
  end
end
