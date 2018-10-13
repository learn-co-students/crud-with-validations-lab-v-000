class SongsController < ApplicationController
    before_action :get_song, only: [:show, :edit, :update, :destroy]
    before_action :new_song, only: [:new]
    def index
        @songs = Song.all
    end

    def show
        
    end

    def edit

    end

    def new

    end

    def create
        @song = Song.new(song_params(:title, :released, :release_year, :artist_name, :genre))
        if @song.save
            redirect_to song_path(@song) 
        else
            render :new
        end
    end

    def update
        if @song.update(song_params(:title, :released, :release_year, :artist_name, :genre))
            redirect_to song_path(@song) 
        else
            render :edit
        end
    end

    def destroy
        @song.delete
        redirect_to songs_path
    end

    private

    def song_params(*args)
        params.require(:song).permit(*args)
    end

    def get_song
        @song = Song.find_by(id: params[:id])
    end

    def new_song
        @song = Song.new
    end
end
