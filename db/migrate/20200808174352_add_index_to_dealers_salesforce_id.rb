class AddIndexToDealersSalesforceId < ActiveRecord::Migration[6.0]
  def change
    add_index :dealers, :salesforce_id, unique: true
  end
end
