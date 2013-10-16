class ArtistsController < ApplicationController

  # GET /artists
  def index
    @artists = Artist.all
  end

  # GET /artists/1
  def show
    @artist = Artist.find(params[:id])
  end
end
