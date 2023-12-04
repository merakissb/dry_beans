# frozen_string_literal: true

class Route < ApplicationRecord
  has_many :trips

  validates :date, presence: true

  enum status: %i[created canceled completed]
end
