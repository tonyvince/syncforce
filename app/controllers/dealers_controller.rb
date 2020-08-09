# frozen_string_literal: true

# See interactors for DealersController business logic
class DealersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index; end

  def create
    result = SyncDealers.call

    if result.success?
      @job_id = result.job_id
    else
      @message = t(result.message)
    end
  end
end
