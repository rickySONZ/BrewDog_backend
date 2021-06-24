class Api::V1::CapsController < ApplicationController
  before_action :set_cap, only: [:show, :update, :destroy]

  # GET /caps
  def index
    @caps = Cap.all

    render json: @caps
  end

  # GET /caps/1
  def show
    
    render json: @cap
  end

  # POST /caps
  def create
    @cap = Cap.new(cap_params)

    if @cap.save
      render json: @cap, status: :created, location: @cap
    else
      render json: @cap.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /caps/1
  def update
    if @cap.update(cap_params)
      render json: @cap
    else
      render json: @cap.errors, status: :unprocessable_entity
    end
  end

  # DELETE /caps/1
  def destroy
    @cap.destroy
  end

  def update_cap
    @cap = Cap.first
    if @cap.amount < 799
      @cap.add_request
      render json: @cap.to_json(include: [:updated_at])
    else
      render json: @cap, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cap
      @cap = Cap.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cap_params
      params.require(:cap).permit(:amount, :month)
    end
end
