require 'rails_helper'

describe DealersSyncService do
  subject { described_class.call }
  let(:sf_client) { double('SalesforceService') }
  let(:results) { [] }

  before do
    allow(SalesforceService).to receive(:call) { sf_client }
    allow(sf_client).to receive(:query).with(described_class::QUERY) { results }
  end

  context 'when dealer data is present' do
    let(:results) { [dealer_1, dealer_2] }
    let(:dealer_1) do
      double('dealer', Id: '101ob3', Name: 'REI - Dublin', POS_Street__c: '12485 1re Avenue',
                       POS_City__c: 'St-Georges', POS_ZIP__c: 'G5Y 2E3', POS_Country__c: 'Ireland',
                       POS_State__c: 'Dublin', POS_Phone__c: '418-228-1049', Dealer_Latitude__c: 46.098499,
                       Dealer_Longitude__c: -70.651604)
    end
    let(:dealer_2) do
      double('dealer', Id: '0012o00002Ip8gkAAB', Name: 'Chronocité', POS_Street__c: 'Koemaste 2C',
                       POS_City__c: 'Hellendoorn', POS_ZIP__c: '7447AV', POS_Country__c: 'Netherlands',
                       POS_State__c: 'Overijssel', POS_Phone__c: nil, Dealer_Latitude__c: 52.390166,
                       Dealer_Longitude__c: 6.45593)
    end

    it 'syncs dealers from salesforce' do
      expect { subject }.to change { Dealer.count }.by(2)
    end

    context 'when dealer already exists in the system' do
      before do
        create :dealer, salesforce_id: dealer_2.Id, name: dealer_2.Name,
                        street: dealer_2.POS_Street__c, city: dealer_2.POS_City__c,
                        zipcode: dealer_2.POS_ZIP__c, country: dealer_2.POS_Country__c,
                        state: dealer_2.POS_State__c, phone: dealer_2.POS_Phone__c,
                        latitude: dealer_2.Dealer_Latitude__c, longitude: dealer_2.Dealer_Longitude__c
      end

      it 'does not sync duplicate records' do
        expect { subject }.to change { Dealer.count }.by(1)
      end
    end

    context 'when deler is deleted from salesforce' do
      before do
        create :dealer, salesforce_id: dealer_1.Id, name: dealer_1.Name,
                        street: dealer_1.POS_Street__c, city: dealer_1.POS_City__c,
                        zipcode: dealer_1.POS_ZIP__c, country: dealer_1.POS_Country__c,
                        state: dealer_1.POS_State__c, phone: dealer_1.POS_Phone__c,
                        latitude: dealer_1.Dealer_Latitude__c, longitude: dealer_1.Dealer_Longitude__c

        create :dealer, salesforce_id: dealer_2.Id, name: dealer_2.Name,
                        street: dealer_2.POS_Street__c, city: dealer_2.POS_City__c,
                        zipcode: dealer_2.POS_ZIP__c, country: dealer_2.POS_Country__c,
                        state: dealer_2.POS_State__c, phone: dealer_2.POS_Phone__c,
                        latitude: dealer_2.Dealer_Latitude__c, longitude: dealer_2.Dealer_Longitude__c
      end
      let(:results) { [dealer_1] }

      it 'deletes dealer record from system database' do
        expect { subject }.to change { Dealer.count }.by(-1)
      end
    end
  end
end
