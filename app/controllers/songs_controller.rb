class SongsController < ApplicationController
  def new
    @song= Song.new
  end

  def create
    @song= Song.new(song_params)

    if @song.save
      redirect song_path(@song)
    else
      render :new
    end
  end

end
