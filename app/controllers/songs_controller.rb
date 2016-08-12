class SongsController < ApplicationController

  def new
    @song = Song.new
  end

  def create
      # we need to create song from params inserted
      # However, we need the params to be strong

      #create song instance + strong params
      @song = Song.new(song_params)
      #now, only if song was succssefully created (if it met strong params )
      if @song.save
        #redirect user show page for this index
        # (since by convention it will show create we need to redirect to show )
        redirect_to @song
      else
        #render new
        render :new
      end
  end

  def index
    @song = Song.all
  end

  def edit

  end


  def song_params
  params.require(:song).permit(
    :title, :release_year, :released, :genre, :artist_name
  )
end
end 
