class TripSerializer < ActiveModel::Serializer
  attributes :id, :name, :date
  has_many :deliveries
end
