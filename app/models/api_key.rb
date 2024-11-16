# frozen_string_literal: true

class ApiKey < ApplicationRecord
  validates :key, uniqueness: true

  before_create :generate_api_token

  private

  def generate_api_token
    self.key = SecureRandom.hex(32)
  end
end
