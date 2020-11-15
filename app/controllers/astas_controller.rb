class AstasController < ApplicationController
  before_action :set_user

  def index
    @aste = Asta.where('fine >= ?', Time.now)
  end

  def show
    @aste_user = Asta.find_by_user(@user.id)
    @aste_artista = Asta.find_by_artista(@user.artista_id)

  end

  def new
    @asta = Asta.new
    @opere = Opera.find_by_artista(@user.artista_id)
  end

  def create
    @asta = Asta.new(asta_params)
    @asta.inizio = params[:data_inizio] + " " + params[:ora_inizio]
    @asta.fine = params[:data_fine] + " " + params[:ora_fine]
    byebug
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

  private
  def set_user
    @user = User.find(current_user.id)
  end

  def asta_params
    params.require(:asta).permit(:opera_id, :inizio, :fine)
  end
end
