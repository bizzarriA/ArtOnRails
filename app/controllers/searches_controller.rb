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
    redirect_to searches_path(id: @search.id)
  end

  # GET /searches/1
  def show
    search = Search.find(params[:id])
    @search = Search.search(search)
    # @search.shuffle
    if current_user.nil?
      @preferiti = []
    else
      @preferiti = Favorite.opere(current_user.id)
    end
    render layout: "gallery"
  end

  private

  # Only allow a list of trusted parameters through.
  def search_params
    params.require(:search).permit(:titolo, :tecnica, :anno, :artista)
  end
end
