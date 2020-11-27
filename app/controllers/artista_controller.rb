class ArtistaController < ApplicationController
  before_action :set_artistum, only: [:show, :aste]


  # GET /artista/1
  # GET /artista/1.json
  def show
    @operas = Opera.where('artista_id=?', @artistum.id)
    @user = User.find_by_artista_id(@artistum.id)
    if current_user.nil?
      @preferiti = []
    else
      @preferiti = Favorite.opere(current_user.id)
    end
    render layout: "gallery"
  end

  def aste
    @aste= Asta.find_by_artista(@artistum.id)
    render layout: 'gallery'
  end

  # GET /artista/new
  def new
    @artistum = Artistum.new
    render layout: "application"
  end

  # POST /artista
  # POST /artista.json
  def create
    @artistum = Artistum.new(artistum_params)

    respond_to do |format|
      if @artistum.save
        current_user.update(artista_id: @artistum.id)
        format.html { redirect_to @artistum, notice: 'Artistum was successfully created.' }
        format.json { render :show, status: :created, location: @artistum }
      else
        format.html { render :new }
        format.json { render json: @artistum.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_artistum
    @artistum = Artistum.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def artistum_params
    params.fetch(:artistum, {})
  end
end
