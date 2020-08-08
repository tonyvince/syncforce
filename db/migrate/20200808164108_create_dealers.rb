class CreateDealers < ActiveRecord::Migration[6.0]
  def change
    create_table :dealers do |t|
      t.string :salesforce_id
      t.string :name
      t.string :street
      t.string :zipcode
      t.string :city
      t.string :country
      t.string :state
      t.string :phone
      # From the Google Maps documentation:
      # To keep the storage space required for your table at a minimum,
      # you can specify that the lat and lng attributes are floats of size (10,6)
      t.decimal :latitude, precision: 10, scale: 6
      t.decimal :longitude, precision: 10, scale: 6

      t.timestamps
    end
  end
end
