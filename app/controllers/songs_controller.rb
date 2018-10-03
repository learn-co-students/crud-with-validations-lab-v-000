require 'pry'
class SongsController < ApplicationController
  def new
    @song = Song.new
  end

  def create
    binding.pry
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def index
    @songs = Song.all
  end

  def show
  end
end
