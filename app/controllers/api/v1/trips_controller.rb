# # frozen_string_literal: true

# module Api
#   module V1
#     class TripsController < ApiControllers
#       before_action :set_trip, only: %i[show]

#       # GET api/v1/trips
#       def index
#         _, trips = pagy(Trip.all, page: params[:page])
#         render json: trips, status: :ok
#       end

#       # GET api/v1/trips/:id
#       def show
#         render json: @trip, status: :ok
#       end

#       # POST api/v1/trips
#       # body example
#       # {
#       #   "trip": {
#       #     "name": "Trip 1 Route 1",
#       #     "date": "2023-12-04",
#       #     "route_id": "1"
#       #   }
#       # }
#       def create
#         trip = Trip.new(trip_params)

#         if trip.save
#           render json: trip, status: :created
#         else
#           render json: { errors: trip.errors.full_messages }, status: :unprocessable_entity
#         end
#       end

#       private

#       def set_trip
#         @trip = Trip.find_by(id: params[:id])

#         render json: { errors: I18n.t('errors.trip_not_found') }, status: :not_found unless @trip.present?
#       end

#       def trip_params
#         params.require(:trip).permit(:name, :status, :date, :route_id)
#       end
#     end
#   end
# end
