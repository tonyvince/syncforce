# frozen_string_lietral: true

# Sync dealers from salesforce to localdb
class SyncDealers
  include Interactor

  def call
    context.fail!(message: 'salesforce_sync.busy') if syncing?

    context.job_id = SyncDealersJob.perform_later.provider_job_id
  end

  private

  def syncing?
    Delayed::Job.where(queue: SyncDealersJob.queue_name, failed_at: nil).exists?
  end
end
