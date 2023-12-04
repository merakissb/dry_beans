class TripSerializer < ActiveModel::Serializer
  attributes :id, :name, :date, :deliveries
end
