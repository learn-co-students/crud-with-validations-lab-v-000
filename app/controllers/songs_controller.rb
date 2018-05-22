class SongsController < ApplicationController
    def index
        @songs = Song.all
    end

    def new
        @song = Song.new
    end

    def edit
        @song = Song.find(params[:id])
    end

    def show
        @song = Song.find(params[:id])
        # raise params.inspect
    end

    def create
        @song = Song.create(song_params)
        # binding.pry
        if @song.valid?
            @song.save
            redirect_to song_path(@song)
        else
            render :new
        end
    end

    def update
    end

    def delete
    end

    private

    def song_params
        params.permit(:title, :released, :release_year, :artist_name, :genre)
    end
end
