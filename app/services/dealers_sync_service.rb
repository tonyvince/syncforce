# frozen_string_literal: true

# Sync delaers in the background
class DealersSyncService < ApplicationService
  attr_reader :client

  QUERY = "SELECT
    Id, Name, POS_Street__c, POS_City__c,
    POS_ZIP__c, POS_Country__c, POS_State__c,
    POS_Phone__c, Dealer_Latitude__c, Dealer_Longitude__c
  FROM Account WHERE E_Shop_Dealer__c = 'Dealer and Point of Sale'"

  def initialize
    @client = SalesforceService.call
  end

  def call
    dealers = client.query QUERY
    # in this case .map is faster than .pluck
    # because results is of type Restforce::Collection
    remove_deleted_dealers(dealer_ids: dealers.map(&:Id))
    sync_dealer_data(items: dealers)
  end

  private

  def remove_deleted_dealers(dealer_ids: [])
    Dealer.where.not(salesforce_id: dealer_ids).destroy_all
  end

  def sync_dealer_data(items: {})
    items.each do |item|
      # first_or_initialize prevents dealers being duplicated
      # also enables updating any changes made to existing dealers in sf
      dealer = Dealer.where(salesforce_id: item.Id).first_or_initialize
      dealer.assign_attributes(
        name: item.Name, street: item.POS_Street__c, city: item.POS_City__c,
        zipcode: item.POS_ZIP__c, country: item.POS_Country__c, state: item.POS_State__c,
        phone: item.POS_Phone__c, latitude: item.Dealer_Latitude__c, longitude: item.Dealer_Longitude__c
      )
      dealer.save
    end
  end
end
