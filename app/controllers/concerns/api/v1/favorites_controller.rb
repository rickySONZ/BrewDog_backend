class Api::V1::FavoritesController < ApplicationController
  before_action :set_favorite, only: [:show, :update, :destroy]

  # GET /favorites
  def index

    @favorites = Favorite.where(user_id: params[:user_id])

    render json: @favorites.to_json(include: [:brewery])
  end

  # GET /favorites/1
  def show
   
    render json: @favorite
  end

  # POST /favorites
  def create
    
    @favorite = Favorite.new(brewery_id: params[:favorite], user_id: params[:user_id])

    if @favorite.save
      render json: @favorite, status: :created
    else
      render json: @favorite.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /favorites/1
  def update
    if @favorite.update(favorite_params)
      render json: @favorite
    else
      render json: @favorite.errors, status: :unprocessable_entity
    end
  end

  # DELETE /favorites/1
  def destroy
    render json: @favorite
    @favorite.destroy
   
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorite
      @favorite = Favorite.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def favorite_params
      params.fetch(:favorite, {})
    end
end
