class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def new
  end

  def create
  end

  def show
    get_song
  end

  def edit
  end

  def update
  end

  private

    def get_song
      @song = Song.find(params[:id])
    end

end
