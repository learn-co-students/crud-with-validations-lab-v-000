class SongsController < ApplicationController
    
    def new
        @song = Song.new
    end 
    
    def index 
        @songs = Song.all
    end 
    
    def create 
        @song = Song.new(params)
        if @song.valid?
            @song.save
            redirect_to song_path(@song)
        else 
            render :new
    end 
    
    def edit 
    end 
    
    def update 
        
    end 
end
