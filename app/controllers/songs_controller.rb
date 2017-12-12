require 'pry'
class SongsController < ApplicationController


    # before_action :set_song!

    def index
      @songs = Song.all
    end

    def new
      @song = Song.new
    end

    def create

      # binding.pry

      @song = Song.new(song_params)

      if @song.valid?

        @song.save

        redirect_to song_path(@song)

      else

          render :new

      end

    end


    def show
      @song = Song.find(params[:id])
    end

    def edit
      @song = Song.find(params[:id])
    end

    def update
      @song = Song.find(params[:id])
      if @song.update(song_params)
        redirect_to song_path(@song)
      else
        render :edit
      end

    end

    def destroy
      Song.find(params[:id]).destroy
      redirect_to songs_path
    end

    private

    def song_params(*args)
      params.require(:song).permit(:title, :artist_name, :released, :release_year, :genre)
    end

    # def set_song!
    #   @song = Song.find(params[:id])
    # end
end
