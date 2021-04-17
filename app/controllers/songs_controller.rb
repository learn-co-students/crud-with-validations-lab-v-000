class SongsController < ApplicationController
    before_action :set_song, only: [:show, :edit, :update, :destroy]

    def index
        @songs = Song.all
    end

    def new
        @song = Song.new
    end

    def create
        @song = Song.new(song_params(:title, :release_year, :released, :genre, :artist_name))

        if @song.valid?
            @song.save
            
            redirect_to song_path(@song)
        else
            render :new
        end
    end

    def edit
        # set via before_action
    end

    def update
        @song.update(song_params(:title, :release_year, :released, :genre, :artist_name))

        if @song.valid?
            redirect_to song_path(@song)
        else
            render :edit
        end
    end

    def destroy
        Song.find(@song.id).destroy
        redirect_to songs_path
    end

    def show
        # set via before_action
    end

    private

    def set_song
        @song = Song.find(params[:id])
    end

    def song_params(*args)
        params.require(:song).permit(*args)
    end
end
