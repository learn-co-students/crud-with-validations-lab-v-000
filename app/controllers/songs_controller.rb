class SongsController < ApplicationController
    
    def index
        @songs = Song.all
    end
    
    def new
        @song = Song.new
    end
    
    def create
        @song = Song.new(post_params(:title, :released, :release_year, :artist_name, :genre))
        
        if @song.save
            redirect_to song_path(@song)
        else
            render :new
        end
    end
    
    def show
        set_song
    end
    
    def edit
        set_song
    end
    
    def update
        set_song
        
        if @song.update(post_params(:title, :released, :release_year, :artist_name, :genre))
            redirect_to song_path(@song)
        else
            render :edit
        end
        
    end
    
    def destroy
        set_song.destroy
        redirect_to songs_path
    end
    
    private
    
    def post_params(*args)
        params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
    end
    
    def set_song
        @song = Song.find(params[:id])
    end
end
