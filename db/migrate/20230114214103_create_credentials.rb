class CreateCredentials < ActiveRecord::Migration[6.1]
  def change
    create_table :credentials do |t|
      t.references :user, foreign_key: true, index: true
      t.string :public_key, null: false
      t.string :private_key, null: false

      t.timestamps
    end
  end
end
