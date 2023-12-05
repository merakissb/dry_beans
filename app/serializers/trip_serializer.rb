class TripSerializer < ActiveModel::Serializer
  attributes :id, :name, :date, :status, :route_id
  attribute :deliveries, if: :deliveries?

  def deliveries?
    object.deliveries.present?
  end

  def deliveries
    object.deliveries.map do |delivery|
      ::DeliverySerializer.new(delivery).attributes
    end
  end

  def date
    object.date.strftime('%Y-%m-%d')
  end
end
