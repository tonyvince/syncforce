require 'rails_helper'

RSpec.describe SyncDealersJob, type: :job do
  it 'syncs data from salesforce in the background' do
    expect(DealersSyncService).to receive(:call) { true }
    described_class.perform_later
  end
end
