class AcquistosController < ApplicationController

  before_action :set_opera, only: [:new]

  def show
    @acquisti = Acquisto.opere(current_user.id)
    if current_user.nil?
      @preferiti = []
    else
      @favorite_opere = Favorite.opere(current_user.id)
      @preferiti = @favorite_opere
    end
    render layout: "gallery"
  end

  def new
    @acquisto = Acquisto.new
    @pay_methods = Pagamento.find_pay_methods(current_user.id)
    @has_asta = !Asta.find_by_opera_id(@opera.id).nil?
    @user_artista = User.find_by_opera(@opera.id)
    # byebug
    if Acquisto.where("user_id = ? AND opera_id= ?", current_user.id, @opera.id).exists?
      @acquistato = true
    else
      @acquistato = false
    end
    @artista=User.find_by_artista_id(Artistum.find(@opera.artista_id).id)
  end

  def create
    @acquisto = Acquisto.new(acquisto_params)
    @acquisto.update(user_id: current_user.id)
    respond_to do |format|
      if @acquisto.save
        format.html { redirect_to acquistos_path, notice: 'Acquisto was successfully created.' }
        format.json { render :show, status: :created, location: @acquisto }
      else
        format.html { render :show }
        format.json { render json: @acquisto.errors, status: :unprocessable_entity }
      end
    end

  end

  private

  def set_opera
    @opera = Opera.find(params[:opera_id])
  end

  def acquisto_params
    params.require(:acquisto).permit(:opera_id, :pagamento_id)
  end
end
