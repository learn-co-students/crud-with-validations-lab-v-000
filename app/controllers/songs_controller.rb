class SongsController < ApplicationController

    def index
        @songs = Song.all
    end

    def new
        @song = Song.new
    end

    def create
        @song = Song.new(song_params)
        if @song.save
            redirect_to song_path
        else
            render :new
        end
    end

    def edit
        @song = Song.find(params[:id])
    end

    def update
        @song = Song.find(params[:id])
        if @song.update(song_params)
            redirect_to song_path
        else
            render :edit
        end
    end

    private
    
    def song_params
        params.require(:song).permit(:title, :release_year, :released, :genre, :artist_name)
    end
end
