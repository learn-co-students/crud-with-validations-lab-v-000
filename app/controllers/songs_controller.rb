class SongsController < ApplicationController
    
    def new
        @song = Song.new
    end 
    
    def index 
        @songs = Song.all
    end 
    
    def create 
    end 
    
    def edit 
    end 
    
    def update 
        
    end 
end
