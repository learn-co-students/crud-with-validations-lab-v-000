class SongsController < ApplicationController
  def index
    @songs = Song.all
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:song).permit(:title)
    end
end
