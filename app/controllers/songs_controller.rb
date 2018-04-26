class SongsController < ApplicationController

  def index
    @songs = Song.all
    render :index
  end

  def new
  end

  def show
    @song = Song.find(params[:id])
  end

  def create
  end

  def edit
  end

  def update
  end

  def delete
  end


end
