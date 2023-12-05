# frozen_string_literal: true

module Api
  module V1
    class DeliveriesController < ApplicationController
      before_action :set_delivery, only: %i[show]

      # GET api/v1/deliveries
      def index
        _, deliveries = pagy(Delivery.all, page: params[:page], items: params[:items] || 1)
        render json: deliveries, status: :ok
      end

      # GET api/v1/deliveries/:id
      def show
        render json: @delivery, status: :ok
      end

      # POST api/v1/deliveries/
      # body example
      # {
      #   "delivery": {
      #     "delivery_type": "pickup",
      #     "date": "2023-12-05",
      #     "trip_id": "1"
      #   }
      # }
      def create
        delivery = Delivery.new(delivery_params)

        if delivery.save
          render json: delivery, status: :created
        else
          render json: { errors: delivery.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def set_delivery
        @delivery = Delivery.find_by(id: params[:id])

        render json: { errors: I18n.t('errors.delivery_not_found') }, status: :not_found unless @delivery.present?
      end

      def delivery_params
        params.require(:delivery).permit(:delivery_type, :status, :date, :trip_id)
      end
    end
  end
end
