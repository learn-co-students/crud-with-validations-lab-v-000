class SongsController < ActiveRecord::Base
  before_action :set_song!, only: [:show, :edit, :update]

  def new

  end

  def create

  end

  def show

  end

  def index

  end

  def edit

  end

  def update

  end

  def delete
    
  end

  private

  def set_song!
    @song = Song.find(params[:id])
  end
end
