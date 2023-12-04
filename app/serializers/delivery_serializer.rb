class DeliverySerializer < ActiveModel::Serializer
  attributes :id, :delivery_type, :status
end
