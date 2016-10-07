class SongsController < ApplicationController

  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end


  private

  def post_params
    params.permit(:category, :content, :title)
  end


  def set_post!
    @song = Song.find(params[:id])
  end


end
