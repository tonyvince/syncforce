# frozen_string_literal: true

# Base service object
class ApplicationService
  def self.call(*args, &block)
    new(*args, &block).call
  end
end
