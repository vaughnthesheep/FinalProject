class RecordsController < ApplicationController
  # GET /records
  # GET /records.json
  def index
    @records = Record.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @records }
    end
  end

  # GET /records/1
  # GET /records/1.json
  def show
    @record = Record.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @record }
    end
  end

  def search_results
    keywords = params[:keywords]
    @records = Record.where("name LIKE '%#{keywords}%'")
    
    respond_to do |format|
      format.html # search_results.html.erb
      format.json { render json: @records }
    end
  end
end
