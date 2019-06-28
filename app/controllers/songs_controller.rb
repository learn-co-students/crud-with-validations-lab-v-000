class SongsController < ApplicationController
    def show
        @song = Song.find(params[:id])
    end
    
    def new
        @song = Song.new
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

    def index 
        @songs = Song.all 
    end

    def edit
        @song = Song.find(params[:id])
    end
    
    def update
        @song = Song.find(params[:id])

        if @song.update(song_params)
            redirect_to song_path(@song)
        else
            render :edit
        end
    end

    private

    def song_params
        params.permit(:name, :email, :phone_number)
    end
end
