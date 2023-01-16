class ChangePrivateKeyNullCredentials < ActiveRecord::Migration[6.1]
  def up
    change_column_null :credentials, :private_key, true
  end

  def down
    change_column_null :credentials, :private_key, false
  end
end
