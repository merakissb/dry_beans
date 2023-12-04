# frozen_string_literal: true

class Trip < ApplicationRecord
  belongs_to :route
  has_many :deliveries

  validates :date, presence: true

  enum status: %i[pending canceled rejected completed]
end
