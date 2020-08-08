# forzen_string_literal: true

# Sync delaers in the background
class SyncDealersJob < ApplicationJob
  queue_as :urgent

  def perform(*args)
    client = SalesforceService.call
    results = client.query query

    binding.pry
  end

  def query
    "SELECT
      Id, Name, POS_Street__c, POS_City__c, POS_ZIP__c, POS_Country__c, POS_State__c,
      POS_Phone__c, Dealer_Latitude__c, Dealer_Longitude__c
    FROM Account WHERE E_Shop_Dealer__c = 'Dealer and Point of Sale'".freeze
  end
end
