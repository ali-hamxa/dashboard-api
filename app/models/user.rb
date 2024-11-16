# frozen_string_literal: true

class User < ApplicationRecord
  validates :email, uniqueness: true
  validates :email, :name, :continent, :country, :city, :state, presence: true
end
