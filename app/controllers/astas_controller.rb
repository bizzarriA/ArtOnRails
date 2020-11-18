class AstasController < ApplicationController
  before_action :set_user

  def index
    @aste = Asta.all
    render layout: "gallery"
  end

  def show
    @asta = Asta.includes(:opera).find(params[:id])
    @offerte = Offerta.where("asta_id = ?", @asta.id)
    @user = User.find_by_opera(@asta.opera_id)
    # byebug
  end

  def new
    @asta = Asta.new
    @opere = Opera.find_by_artista(@user.artista_id)
    @edit = false
  end

  def create
    @asta = Asta.new(asta_params)
    @asta.inizio = params[:data_inizio] + " " + params[:ora_inizio]
    @asta.fine = params[:data_fine] + " " + params[:ora_fine]
    respond_to do |format|
      if @asta.save
        format.html { redirect_to (session.delete(:return_to) || astas_path(@user)), notice: 'Asta was successfully created.'}
        format.json { render :show, status: :created, location: @asta }
      else
        format.html { render :index, notice: 'Messagge error'}
        format.json { render json: @asta.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @asta = Asta.includes(:opera).find(params[:id])
    @edit = true
  end

  def update
    @asta = Asta.find(params[:id])
    respond_to do |format|
      if @asta.update(asta_params)
        format.html { redirect_to astas_path, notice: 'Opera was successfully updated.' }
        format.json { render :show, status: :ok, location: @asta }
      else
        format.html { redirect_to astas_path(id: @asta.id), notice: "Errore"}
        format.json { render json: @asta.errors, status: :unprocessable_entity }
      end
    end
  end
  private
  def set_user
    @user = User.find(current_user.id)
  end

  def asta_params
    params.require(:asta).permit(:opera_id, :inizio, :fine)
  end
end
