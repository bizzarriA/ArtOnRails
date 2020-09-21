class ArtistaController < ApplicationController
  before_action :set_artistum, only: [:show, :edit, :update, :destroy]
  layout "gallery"

  # GET /artista/1
  # GET /artista/1.json
  def show
    @operas = Opera.where('artista_id=?', @artistum.id)
    @user = User.find_by_artista_id(@artistum.id)
  end

  # GET /artista/new
  def new
    @artistum = Artistum.new
  end

  # GET /artista/1/edit
  def edit
  end

  # POST /artista
  # POST /artista.json
  def create
    @artistum = Artistum.new(artistum_params)

    respond_to do |format|
      if @artistum.save
        current_user.update_attributes(artista_id: @artistum.id)
        format.html { redirect_to @artistum, notice: 'Artistum was successfully created.' }
        format.json { render :show, status: :created, location: @artistum }
      else
        format.html { render :new }
        format.json { render json: @artistum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /artista/1
  # PATCH/PUT /artista/1.json
  def update
    respond_to do |format|
      if @artistum.update(artistum_params)
        format.html { redirect_to @artistum, notice: 'Artistum was successfully updated.' }
        format.json { render :show, status: :ok, location: @artistum }
      else
        format.html { render :edit }
        format.json { render json: @artistum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /artista/1
  # DELETE /artista/1.json
  def destroy
    @artistum.destroy
    respond_to do |format|
      format.html { redirect_to artista_url, notice: 'Artistum was successfully destroyed.' }
      format.json { head :no_content }
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
