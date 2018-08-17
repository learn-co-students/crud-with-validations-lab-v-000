class SongsController < ApplicationController


    def index
        @songs = Song.all
    end

    def new
     @song = Song.new
    end

    def show
        @song = Song.find(params[:id])
    end

    def edit
        @song = Song.find(params[:id])
    end


    def update
        @song = Song.find(params[:id])
        
        if @song.update(song_params) 
            redirect_to song_path(@song)
          else
           render :edit    # simply send them back to the edit page... OF what they submited didnt work.
        end
    end
    
    def create
        @song = Song.new(song_params)
         if @song.valid?  #true
            @song.save
          redirect_to song_path(@song)
         else
           render :new
         end
    end
    
  
    #it wants a destroy action.

    def destroy
        Song.find(params[:id]).destroy
        redirect_to songs_url
    end

    private

    def song_params
        params.require(:song).permit(:artist_name, :title, :genre,:released, :release_year)
    end


end
