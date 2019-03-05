class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)

      if @song.valid?
        @song.save
        redirect_to song_path(@song)
      else
        render :new
      end
    end

    def update
      if @song = Song.update(song_params)
          redirect_to song_path(@song)
        else
          render :edit
        end
    end

  


  private
      def song_params(*args)
        params.require(:song).permit(:title, :artist_name, :genre, :release_year, :released)
      end
end
