class CabsController < ApplicationController
  before_action :set_cab, only: [:show, :update, :destroy]

  # GET /cabs
  def index
    @cabs = Cab.all

    render json: @cabs
  end

  # GET /cabs/1
  def show
    render json: @cab
  end

  # POST /cabs
  def create
    @cab = Cab.new(cab_params)

    if @cab.save
      render json: @cab, status: :created, location: @cab
    else
      render json: @cab.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cabs/1
  def update
    if @cab.update(cab_params)
      render json: @cab
    else
      render json: @cab.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cabs/1
  def destroy
    @cab.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cab
      @cab = Cab.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cab_params
      params.fetch(:cab, {})
    end
end
