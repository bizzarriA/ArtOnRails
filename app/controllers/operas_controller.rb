class OperasController < ApplicationController
  before_action :set_opera, only: [:show, :edit, :update, :destroy]

  # layout "gallery"



  # GET /operas/1
  # GET /operas/1.json
  def show
    @artista=User.find_by_artista_id(Artistum.find(@opera.artista_id).id)
  end

  # GET /operas/new
  def new
    @opera = Opera.new

  end

  # GET /operas/1/edit
  def edit

  end

  # POST /operas
  # POST /operas.json
  def create
    @opera = Opera.new(opera_params)
    @opera.artista_id = current_user.artista_id

    respond_to do |format|
      if @opera.save
        format.html { redirect_to opera_path(@opera.id), notice: 'Opera was successfully created.' }
        format.json { render :show, status: :created, location: @opera }
      else
        format.html { redirect_to new_opera_path }
        format.json { render json: @opera.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /operas/1
  # PATCH/PUT /operas/1.json
  def update
    respond_to do |format|
      if @opera.update(opera_params)
        format.html { redirect_to artistum_path(@opera.artista_id), notice: 'Opera was successfully updated.' }
        format.json { render :show, status: :ok, location: @opera }
      else
        format.html { render :edit }
        format.json { render json: @opera.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /operas/1
  # DELETE /operas/1.json
  def destroy
    @opera.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Opera was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_opera
    @opera = Opera.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def opera_params
    params.require(:opera).permit(:titolo, :tecnica, :anno, :url, :merchandising)
  end

end
