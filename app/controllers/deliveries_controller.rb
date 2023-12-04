# frozen_string_literal: true

class DeliveriesController < ApplicationController
  before_action :set_trip, only: %i[create]
  before_action :validate_trip, only: %i[create]

  # POST /routes/:route_id/trips/:trip_id/deliveries
  #
  # body
  # {
  #   "delivery_type": "pickup",
  #   "status": "pending"
  # }
  #
  def create
    delivery = @trip.deliveries.new(delivery_params)

    if delivery.save
      render json: delivery, status: :created
    else
      render json: { errors: delivery.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  private

  def set_trip
    @trip = Trip.find_by(id: params[:trip_id])
  end

  def validate_trip
    return if @trip.present?

    render json: { errors: 'Trip not found' }, status: :not_found
  end

  def delivery_params
    params.permit(:delivery_type, :status)
  end
end
