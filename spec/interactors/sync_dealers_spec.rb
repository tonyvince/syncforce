require 'rails_helper'

describe SyncDealers do
  subject(:context) { SyncDealers.call }

  describe '.call' do
    context 'when syncying is in progress' do
      before do
        Delayed::Job.create!(queue: SyncDealersJob.queue_name, handler: 'SyncDealers')
      end

      it 'fails' do
        expect(context).to be_a_failure
      end
    end

    context 'when syncying is not already in progress' do
      let(:results) { [] }
      let(:sf_client) { double('SalesforceService') }

      before do
        allow(SalesforceService).to receive(:call) { sf_client }
        allow(sf_client).to receive(:query).with(DealersSyncService::QUERY) { results }
      end

      it 'success' do
        expect(context).to be_a_success
      end

      it 'syncs data in the background' do
        expect(SyncDealersJob).to receive(:perform_later) { double('Job', provider_job_id: 1) }
        context
      end

      it 'provides the job_id' do
        expect(context).to respond_to(:job_id)
      end
    end
  end
end
