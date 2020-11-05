class FavoritesController < ApplicationController
  before_action :set_opera, only: [:new]

  def show
    @opere = Favorite.opere(current_user.id)
    render layout: "gallery"
  end

  def new
    @preferito = Favorite.new
    if Favorite.where("user_id = ? AND opera_id= ?", current_user.id, @opera.id).exists?
      @aggiunto = true
    else
      @aggiunto = false
    end
    @artista=User.find_by_artista_id(Artistum.find(@opera.artista_id).id)
  end

  def create
    @preferito = Favorite.new(favorite_params)
    @preferito.update_attributes(user_id: current_user.id)

    respond_to do |format|
      if @preferito.save
        format.html { redirect_to favorites_path, notice: 'Acquisto was successfully created.' }
        format.json { render :show, status: :created, location: @preferito }
      else
        format.html { render :show }
        format.json { render json: @preferito.errors, status: :unprocessable_entity }
      end
    end

  end

  private

  def set_opera
    @opera = Opera.find(params[:opera_id])
  end

  def favorite_params
    params.require(:favorite).permit(:opera_id)
  end
end
