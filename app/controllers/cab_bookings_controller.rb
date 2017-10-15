class CabBookingsController < ApplicationController

  def cab_request
    case params[:color].present? &&  params[:color].eql?("pink")
    when true
      cab = Cab.by_distance(:origin => [params[:latitude],params[:longitude]]).where(color: "pink",available_status: "available").first
    when false
      cab = Cab.closest(:origin => [params[:latitude],params[:longitude]]).where(available_status: "available")
    end
    render json: cab if cab.present?
    render json: "Sorry cabs are not available for your request" if !cab.present?
  end

  def cab_booking
    @travel_detail = TravelDetail.new(cab_booking_params)
    if @travel_detail.save!
      render json: @travel_detail, status: :created
    else
      render json: @travel_detail.errors, status: :unprocessable_entity
    end
  end

  def start_travel
    @travel_detail = TravelDetail.find(params[:cab_booking][:booking_id])
    @travel_detail.start_time = Time.now
    if @travel_detail.update(start_travel_params)
      render json: @travel_detail, status: :created
    else
      render json: @travel_detail.errors, status: :unprocessable_entity
    end
  end

  def finish_travel
    @travel_detail = TravelDetail.find(params[:cab_booking][:booking_id])
    @travel_detail.end_time = Time.now
    if @travel_detail.update(finish_travel_params)
      render json: @travel_detail, status: :created
    else
      render json: @travel_detail.errors, status: :unprocessable_entity
    end
  end

  private
  def cab_booking_params
    params.fetch(:cab_booking).permit(:cab_id,:customer_id,:origin_lat,:origin_long,:destination_lat,:destination_long)
  end

  def start_travel_params
    params.fetch(:cab_booking).permit(:origin_lat,:origin_long)
  end

  def finish_travel_params
    params.fetch(:cab_booking).permit(:destination_lat,:destination_long)
  end
end
