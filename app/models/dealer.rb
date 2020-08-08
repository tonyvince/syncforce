# frozen_string_literal: true

# Validations and associations of Dealer
class Dealer < ApplicationRecord
  validates :salesforce_id, presence: true, uniqueness: true
end
