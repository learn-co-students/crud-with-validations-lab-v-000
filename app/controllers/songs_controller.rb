class SongsController < ApplicationController
    def index
    end
    
    def new
        @song = Song.new
    end
end
