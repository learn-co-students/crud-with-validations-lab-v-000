require 'pry'
class SongsController < ApplicationController
    def new
        @song = Song.new
    end
    
    def create
        @song = Song.new(post_params)
#        binding.pry
        if @song.valid?
            @song.save
            redirect_to song_path(@song)
        else
            render :new
        end
    end
    
    def edit
        @song = Song.find_by(id: params[:id])
    end
    
    def show
        @song = Song.find_by(id: params[:id])
    end
    
    def index
        @songs = Song.all
    end
    
    def update
        @song = Song.find_by(:id => params[:id])
        if @song.update(post_params)
            redirect_to song_path(@song)
        else
            render :edit
        end
    end
    
    def destroy
        @song = Song.find_by(:id => params[:id])
        @song.destroy
        redirect_to songs_path
    end
    
    private
    def post_params
        params.require(:song).permit(:title,:artist_name,:released,:release_year,:genre) 
    end
end