class SongsController < ApplicationController


    def new
     @song = Song.find(params[:id])
    
    end

    def show
        @song = Song.find(params[:id])

    end

    def edit
        @song = Song.find(params[:id])

    end


    def update

    end
    
    def create

    end
  
    #it wants a destroy action.


    private

    def song_params
        params.permit(:artist_name, :title, :genre,:released, :release_year)

    end

end
