# frozen_string_literal: true

class Trip < ApplicationRecord
  belongs_to :route
  has_many :deliveries, dependent: :destroy

  validates :name, :date, presence: true

  enum status: %i[pending canceled rejected completed]

  accepts_nested_attributes_for :deliveries, allow_destroy: true
end
