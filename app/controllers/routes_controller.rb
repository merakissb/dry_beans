# frozen_string_literal: true

class RoutesController < ApplicationController
  before_action :set_route, only: %i[show]
  before_action :validate_route, only: %i[show]

  # GET /routes/:id
  def show
    render json: @route, status: :ok
  end

  private

  def route_params
    params.permit(:id)
  end

  def set_route
    @route = Route.find_by(id: route_params[:id])
  end

  def validate_route
    return if @route.present?

    render json: { errors: 'Route not found' }, status: :not_found
  end
end
