# frozen_string_literal: true

# Initialize salesforce client
class SalesforceService < ApplicationService
  def call
    client = Restforce.new(
      host: ENV['sf_host'],
      username: ENV['sf_username'],
      password: ENV['sf_password'],
      client_id: ENV['sf_client_id'],
      client_secret: ENV['sf_client_secret']
    )
    client.authenticate!
    client
  end
end
