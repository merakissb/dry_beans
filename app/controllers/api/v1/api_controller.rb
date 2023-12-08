# frozen_string_literal: true

module Api
  module V1
    class ApiController < ActionController::Base
      include Pagy::Backend

      def not_found
        render json: { resource_not_found: true }, status: :not_found
      end
    end
  end
end
