# frozen_string_literal: true

# Synch data in the background
class SyncDealersJob < ApplicationJob
  queue_as :salesforce_sync

  def perform
    DealersSyncService.call
  end
end
