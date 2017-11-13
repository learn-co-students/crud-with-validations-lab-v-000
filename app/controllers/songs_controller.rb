class SongsController < ApplicationController

  def index
    @song = Songs.all
  end

  def new
    @song = Songs.new
  end

  def create
    @song = Songs.create
    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def show
    @song = Songs.find(params[:id])
  end

  def edit
    @song = Songs.find(params[:id])
  end

  def update
    @song = Songs.find(params[:id])
  end
  
end
