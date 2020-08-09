# frozen_string_literal: true

# @see interactors/sync_dealers.rb for DealersController business logic
class DealersController < ApplicationController
  def index
    @pagy, @records = pagy(Dealer.order(:name))
  end

  def create
    result = SyncDealers.call

    if result.success?
      @job_id = result.job_id
    else
      @message = t(result.message)
    end
  end
end
