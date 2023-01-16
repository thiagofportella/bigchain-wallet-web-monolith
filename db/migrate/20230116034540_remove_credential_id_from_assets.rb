class RemoveCredentialIdFromAssets < ActiveRecord::Migration[6.1]
  def change
    remove_column :assets, :credential_id
  end
end
