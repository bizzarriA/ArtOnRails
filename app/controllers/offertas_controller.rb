class OffertasController < ApplicationController
  before_action :set_asta, only: [:new]
  # before_action :set_offerta, only: [:update]
  def new
    @fatta = true
    if Offerta.where("user_id = ? AND asta_id = ?", current_user.id, params[:asta_id]).empty?
      @fatta = false
      @offerta = Offerta.new
    elsif @asta.opera.artista_id == current_user.artista_id
      @mia = true
    end
    @asta = Asta.find(params[:asta_id])
    @minimo = Asta.miglior_offerta(@asta.id)

  end

  def create
    @offerta = Offerta.new(offerta_params)
    respond_to do |format|
      if @offerta.save
        format.html { redirect_to user_offerte_path, notice: 'Offerta was successfully created.'}
        format.json { render :show, status: :created, location: @offerta }
      else
        format.html { redirect_to new_offertas_path(asta_id: @offerta.asta_id), notice: 'Errore creazione offerta'}
        format.json { render json: @offerta.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @offerta = Offerta.find_my_offert(params[:asta_id], current_user.id)
    @asta = Asta.find(params[:asta_id])
    @minimo = Asta.miglior_offerta(@asta.id)
  end

  def update
    @offerta = Offerta.find(params[:id])
    importo_min = Asta.miglior_offerta(@offerta.asta_id).importo
    respond_to do |format|
      if @offerta.update(offerta_params)
        format.html { redirect_to user_offerte_path, notice: 'Opera was successfully updated.' }
        format.json { render :show, status: :ok, location: @offerta }
      else
        format.html { redirect_to edit_offertas_path(id: @offerta.id), notice: "Errore: Non puoi fare un'offerta più bassa di: " + String(importo_min)}
        format.json { render json: @offerta.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @offerta.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Opera was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_asta
    @asta = Asta.includes(:opera).find(params[:asta_id])
  end
  def set_offerta
    @offerta = Offerta.find(params[:offerta_id])
  end
  def offerta_params
    params.require(:offerta).permit(:importo, :asta_id, :user_id)
  end
end
