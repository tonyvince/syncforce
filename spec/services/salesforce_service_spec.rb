require 'rails_helper'

describe SalesforceService do
  subject { described_class.call }

  it 'initializes and authenticate salesforce client' do
    expect_any_instance_of(Restforce::Data::Client).to receive(:authenticate!)
    subject
  end
end
