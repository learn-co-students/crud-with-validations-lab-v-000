class SongsController < ApplicationController
    
    def index
        @songs = Song.all
    end
    
    def new
        @song = Song.new
    end
    
    def create
        @song = Song.new(params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre))
        if @song.save
          redirect_to song_path(@song)
        else
          render :new
        end
    end
    
    def show
        @song = Song.find_by_id(params[:id])
    end
    
    def edit
        @song = Song.find_by_id(params[:id])
    end
    
    def update
        @song = Song.find_by_id(params[:id])
        if @song.update(params.require(:song).permit(:title, :released, :release_year, :artist_name))
          redirect_to song_path(@song)
        else
          render :edit 
        end
    end
    
    def destroy
        @song = Song.find_by_id(params[:id])
        @song.delete
        redirect_to songs_path
    end
        

end
