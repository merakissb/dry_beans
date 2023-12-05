# frozen_string_literal: true

class Route < ApplicationRecord
  has_many :trips, dependent: :destroy

  validates :date, presence: true

  enum status: %i[created canceled completed]
end
