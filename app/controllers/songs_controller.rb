class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def new
  end

  def show
  end

  def edit
  end

  def delete
  end
end
