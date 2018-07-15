class SongsController < ApplicationController
    before_action :songs, only: :index
  def index
  end

  def show
  end

  private

  def songs
      @songs = Song.all
  end

end
