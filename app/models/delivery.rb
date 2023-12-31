# frozen_string_literal: true

class Delivery < ApplicationRecord
  belongs_to :trip

  validates :date, presence: true

  enum delivery_type: { delivery: 0, pickup: 1 }
  enum status: %i[pending canceled rejected completed]
end
