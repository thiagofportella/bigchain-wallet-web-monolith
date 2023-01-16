class AddAssetsCredentials < ActiveRecord::Migration[6.1]
  def self.up
    create_table :assets_credentials, id: false do |t|
      t.integer :asset_id
      t.integer :credential_id
    end
  end

  def self.down
    drop_table :assets_credentials
  end
end
