class SongsController < ApplicationController


    def index
        @songs = Song.all
    end

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


    private

    def song_params
        params.require(:song).permit(:artist_name, :title, :genre,:released, :release_year)
       #strong sanitizing what is sent through in params...making sure it the data that we want.....
    end

    #read of strong params basics......

end
