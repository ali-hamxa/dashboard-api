# frozen_string_literal: true

class User < ApplicationRecord
  validates :email, uniqueness: true
  validates :email, :name, :continent, :country, :city, :state, presence: true

  def self.filter_options
    {
      continents: distinct.pluck(:continent),
      countries: distinct.pluck(:country),
      states: distinct.pluck(:state),
      cities: distinct.pluck(:city)
    }
  end
end
