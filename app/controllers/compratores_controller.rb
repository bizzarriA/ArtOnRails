class CompratoresController < ApplicationController
  before_action :set_compratore, only: [:show, :edit, :update, :destroy]

  # GET /compratores
  # GET /compratores.json
  def index
    @compratores = Compratore.all
  end

  # GET /compratores/1
  # GET /compratores/1.json
  def show
  end

  # GET /compratores/new
  def new
    @compratore = Compratore.new
  end

  # GET /compratores/1/edit
  def edit
  end

  # POST /compratores
  # POST /compratores.json
  def create
    @compratore = Compratore.new(compratore_params)

    respond_to do |format|
      if @compratore.save
        format.html { redirect_to @compratore, notice: 'Compratore was successfully created.' }
        format.json { render :show, status: :created, location: @compratore }
      else
        format.html { render :new }
        format.json { render json: @compratore.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /compratores/1
  # PATCH/PUT /compratores/1.json
  def update
    respond_to do |format|
      if @compratore.update(compratore_params)
        format.html { redirect_to @compratore, notice: 'Compratore was successfully updated.' }
        format.json { render :show, status: :ok, location: @compratore }
      else
        format.html { render :edit }
        format.json { render json: @compratore.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /compratores/1
  # DELETE /compratores/1.json
  def destroy
    @compratore.destroy
    respond_to do |format|
      format.html { redirect_to compratores_url, notice: 'Compratore was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_compratore
      @compratore = Compratore.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def compratore_params
      params.fetch(:compratore, {})
    end
end
