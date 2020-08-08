class CreateDealers < ActiveRecord::Migration[6.0]
  def change
    create_table :dealers do |t|
      t.integer :salesforce_id
      t.string :name
      t.string :street
      t.string :zipcode
      t.string :city
      t.string :country
      t.string :state
      t.string :phone
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
