class SongsController < ApplicationController

    def index 
        @songs = Song.all
    end

    def new 
        @song = Song.new
    end 

    def create 
        @song = Song.new(songs_params)
        if @song.save
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
        if @song.update(songs_params)
            redirect_to song_path(@song)
        else 
            render :edit
        end
    end

    def destroy
        @song = Song.find(params[:id]).destroy
        redirect_to songs_path
    end

    private

    def songs_params
        params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
    end
end
