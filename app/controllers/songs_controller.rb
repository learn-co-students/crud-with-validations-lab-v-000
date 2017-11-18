class SongsController < ApplicationController

    def show
      @song = Song.find(params[:id])
    end

    def new
    end

    def create
      @song = Song.new(song_params)

      if @song.valid?
         @song.save
         redirect_to song_path(@song)
      else
        render :new
      end
    end

  def edit
  end


  def update
    @song.update(song_params)

    if @song.valid?

       redirect_to song_path(@song)
     else
       render :edit
     end
  end

    private

    def song_params
      params.permit(:email, :name) #need the required params here too
    end
  
end
