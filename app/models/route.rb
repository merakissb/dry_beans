# frozen_string_literal: true

class Route < ApplicationRecord
  has_many :trips, dependent: :destroy

  validates :name, :date, presence: true

  enum status: %i[created canceled completed]

  accepts_nested_attributes_for :trips, allow_destroy: true
end
