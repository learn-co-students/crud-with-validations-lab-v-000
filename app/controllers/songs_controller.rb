class SongsController < ApplicationController

    def index
        @songs = Song.all
    end

    def show
        @song = Song.find(params[:id])
    end

    def new
        @song = Song.new
    end

    def create
        @song = Song.create(song_params)
        if @song.valid?
            redirect_to song_path(@song)
        else
            render :new
        end 
    end

    def edit
        @song = Song.find(params[:id])
    end

    def update
        @song = Song.update(song_params)
        if @song.valid?
            redirect_to song_path(@song)
        else
            render :edit
        end 
    end

    def delete
        Song.find(params[:id]).delete
        redirect_to song_path
    end

    private

    def song_params
        params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
    end
end
