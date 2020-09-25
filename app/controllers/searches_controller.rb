class SearchesController < ApplicationController

  # layout "gallery"

  # GET /searches
  def index

  end


  # GET /searches/new
  def new
    @search = Search.new
  end

  # POST /searches
  def create
    @search = Search.new(search_params)
    @search.save!
    redirect_to searches_path
  end

  # GET /searches/1
  def show
    @search = Search.search(search_params)
  end

  private

  # Only allow a list of trusted parameters through.
  def search_params
    params.require(:search).permit(:titolo, :tecnica, :anno, :artista)
  end
end
