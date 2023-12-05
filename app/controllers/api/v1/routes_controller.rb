# frozen_string_literal: true
module Api
  module V1
    class RoutesController < ApplicationController
      before_action :set_route, only: %i[show]

      # GET api/v1/routes
      def index
        _, routes = pagy(Route.all, page: params[:page], items: params[:items] || 1)
        render json: routes, status: :ok
      end

      # GET api/v1/routes/:id
      def show
        render json: @route, status: :ok
      end

      # POST api/v1/routes/
      # body example
      # {
      #   "name": "Ruta 1",
      #   "date": "2023-12-04"
      # }
      def create
        route = Route.new(route_params)

        if route.save
          render json: route, status: :created
        else
          render json: { errors: route.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def set_route
        @route = Route.find_by(id: params[:id])

        render json: { errors: I18n.t('errors.route_not_found') }, status: :not_found unless @route.present?
      end

      def route_params
        params.require(:route).permit(:name, :status, :date)
      end
    end
  end
end
