class DeliverySerializer < ActiveModel::Serializer
  attributes :id, :delivery_type, :status
  belongs_to :trip
end
