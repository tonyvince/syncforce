require 'rails_helper'

RSpec.describe 'Dealers', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get dealers_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /create' do
    let(:sf_client) { double('SalesforceService') }
    let(:results) { [] }
    let(:subject) { post dealers_path, params: { format: :js } }

    before do
      allow(SalesforceService).to receive(:call) { sf_client }
      allow(sf_client).to receive(:query).with(DealersSyncService::QUERY) { results }
    end

    it 'returns http success' do
      subject
      expect(response).to have_http_status(:success)
    end

    context 'when dealears are present in salesforce' do
      let(:results) { [dealer_1] }
      let(:dealer_1) do
        double('dealer', Id: '101ob3', Name: 'REI - Dublin', POS_Street__c: '12485 1re Avenue',
                         POS_City__c: 'St-Georges', POS_ZIP__c: 'G5Y 2E3', POS_Country__c: 'Ireland',
                         POS_State__c: 'Dublin', POS_Phone__c: '418-228-1049', Dealer_Latitude__c: 46.098499,
                         Dealer_Longitude__c: -70.651604)
      end

      it 'syncs dealers from salesforce' do
        expect { subject }.to change { Dealer.count }.by(1)
      end
    end
  end
end
