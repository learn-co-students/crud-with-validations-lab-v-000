class SongsController < ApplicationController

    def index
        @songs = Song.all
    end

    def new
    end

    def show
        @song = Song.find_by(:id => params[:id])
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

    def edit
        @song = Song.find_by(params[:id])
    end

    def update
        @song = Song.find_by(params[:id])
        @song.assign_attributes(song_params)
        if @song.valid?
            @song.save
            redirect_to song_path(@song)
        else
            render :edit
        end
    end

    def delete
    end

    def song_params(*args)
        params.require(:song).permit(*args)
    end
end
