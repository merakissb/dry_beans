# frozen_string_literal: true

module Api
  module V1
    class RoutesController < ApiController
      before_action :set_route, only: %i[show]
      before_action :validate_params, only: %i[create]

      # GET api/v1/routes
      def index
        _, routes = pagy(Route.includes(trips: :deliveries).all, page: params[:page])
        render json: routes, status: :ok
      end

      # GET api/v1/routes/:id
      def show
        render json: @route, status: :ok
      end

      # POST api/v1/routes/
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

        not_found unless @route.present?
      end

      def route_params
        params.require(:route).permit(
          :name, :status, :date,
          trips_attributes: [
            :name, :status, :date,
            {
              deliveries_attributes: %i[delivery_type status date]
            }
          ]
        )
      end

      def validate_params
        return if params[:route].present?

        render json: { errors: I18n.t('errors.invalid_params') }, status: :unprocessable_entity
      end
    end
  end
end
