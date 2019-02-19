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
        @song = Song.new(:title, :released, :released_year, :artist_name, :genre)
        if @song.valid?
            @song.save
            redirect_to song_path(@song)
        else 
          render :new 
        end
    end

    def edit
        @song = Song.find(params[:id])
    end

    def update
        @song = Song.find(params[:id])
        @song.update(song_params(:title, :released, :released_year, :artist_name, :genre))
        redirect_to song_path(@song)
    end



    private
    def song_params(*args)
        params.require(:song).permit(*args)
    end
end
