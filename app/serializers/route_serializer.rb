class RouteSerializer < ActiveModel::Serializer
  attributes :id, :name, :date
  has_many :trips
end
