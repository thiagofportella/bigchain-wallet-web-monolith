class RemoveUserFromAssets < ActiveRecord::Migration[6.1]
  def change
    remove_column :assets, :user_id
  end
end
