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
        @song = Song.new 
        @song.title = params["song"]["title"]
        @song.artist_name = params["song"]["artist_name"]
        @song.release_year = params["song"]["release_year"]
        @song.released = params["song"]["released"]
        @song.genre = params["song"]["genre"]

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
    end

end