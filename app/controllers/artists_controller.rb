class ArtistsController < ApplicationController
  
  def index
    @artists = Artist.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @artists }
    end
  end

  # GET /artist/1
  # GET /artist/1.json
  def show
    @artist = Artist.find(params[:id])
    @records = Record.where("artist_id = #{@artist.id}")

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @artist }
    end
  end
end
