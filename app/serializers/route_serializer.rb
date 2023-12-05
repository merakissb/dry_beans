class RouteSerializer < ActiveModel::Serializer
  attributes :id, :name, :date, :status
  attribute :trips, if: :trips?

  def trips?
    object.trips.present?
  end

  def trips
    object.trips.map do |trip|
      ::TripSerializer.new(trip).attributes
    end
  end

  def date
    object.date.strftime('%Y-%m-%d')
  end
end
