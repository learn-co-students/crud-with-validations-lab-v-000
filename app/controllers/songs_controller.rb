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
            redirect_to song_path(@song)
        else
            render :new
        end
    end

    def show
        @song = find_song
    end

    def edit
        @song = find_song
    end

    def update
        @song = find_song
        if @song.update(song_params)
            redirect_to song_path(@song)
        else
            render :edit
        end
    end

    def destroy
        find_song.destroy
        redirect_to songs_path
    end

private
    def find_song
        Song.find(params[:id])
    end

    def song_params
        params.require(:song).permit(:title, :genre, :released, :release_year, :artist_name)
    end

end
