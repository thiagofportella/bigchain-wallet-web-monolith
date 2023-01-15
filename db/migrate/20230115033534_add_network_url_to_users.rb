class AddNetworkUrlToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :network_url, :string
  end
end
