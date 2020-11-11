class FavoritesController < ApplicationController
  before_action :set_opera, only: [:new, :destroy]

  def show
    @opere = Favorite.opere(current_user.id)

    render layout: "gallery"
  end

  def new
    session[:return_to] ||= request.referer
    @preferito = Favorite.new
    @preferito.update_attributes(opera_id: @opera.id, user_id: current_user.id)
    # byebug
    respond_to do |format|
      if @preferito.save
        format.html { redirect_to (session.delete(:return_to) || root_path), notice: 'Acquisto was successfully created.' }
        format.json { render :show, status: :created, location: @preferito }
      else
        format.html { render :show }
        format.json { render json: @preferito.errors, status: :unprocessable_entity }
      end
    end

  end

  # def create
  #   @preferito = Favorite.new(favorite_params)
  #   @preferito.update_attributes(user_id: current_user.id)
  #
  #   respond_to do |format|
  #     if @preferito.save
  #       format.html { redirect_to :back, notice: 'Acquisto was successfully created.' }
  #       format.json { render :show, status: :created, location: @preferito }
  #     else
  #       format.html { render :show }
  #       format.json { render json: @preferito.errors, status: :unprocessable_entity }
  #     end
  #   end
  #
  # end

  def destroy
    session[:return_to] ||= request.referer
    @favorito = Favorite.where('user_id = ? AND opera_id = ?', current_user.id, @opera.id).first
    # byebug
    @favorito.destroy
    respond_to do |format|
      format.html { redirect_to (session.delete(:return_to) || root_path), notice: 'Opera was successfully destroyed.' }
      format.json { head :no_content }
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
