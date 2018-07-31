class SongsController < ApplicationController
    def show
        @songs = Song.all
    end
    def new
        @song = Song.new
    end

    def create 
        @song = Song.create(song_params)
        if @song.save
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
        if @song.update
            redirect_to song_path(@song)
        else
            render :edit
        end

     end

    private

    def song_params
       params.permit(:title, :releaded, :release_year, :artist_name, :gender)
    end

end
