class SongsController < ApplicationController
    # before_action :get_song
    def get_song
        @song = Song.find(params[:id])
    end

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
        @song = Song.new
        if @song.save
            redirect_to @song
        end
        render :new
    end

    def edit
        @song = Song.find(params[:id])
    end

    def update
        @song = Song.find(params[:id])
        if @song.update(strong_params)
            redirect_to @song
        end
        render :edit
    end

    def delete
        @song = Song.find(params[:id])
        @song.destroy
    end
end
