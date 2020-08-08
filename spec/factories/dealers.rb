FactoryBot.define do
  factory :dealer do
    salesforce_id { 1 }
    name { "MyString" }
    street { "MyString" }
    zipcode { "MyString" }
    city { "MyString" }
    country { "MyString" }
    state { "MyString" }
    phone { "MyString" }
    latitude { "MyString" }
    longitude { "MyString" }
  end
end
