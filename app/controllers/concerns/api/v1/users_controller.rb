require "jwt"
class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  # skip_before-action :authorized, only [:create]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  def profile
    render json: {
      user: {
        id: current_user.id,
        username: current_user.username,
        email: current_user.email,
        password: current_user.password
      }, status: :accepted
    }
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      
      @token = encode_token(user_id: @user.id)

      render json: {
        user: {
          username: @user.username,
          email: @user.email,
          password: @user.password
        },
        token: @token
      }
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
end