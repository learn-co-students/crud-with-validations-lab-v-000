class SongsController < ApplicationController
  def songs
    songs = Song.all

  end
end
