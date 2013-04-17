class AboutsController < ApplicationController
  # GET /abouts
  # GET /abouts.json
  def index
    @about = About.first

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @about }
    end
  end
end
