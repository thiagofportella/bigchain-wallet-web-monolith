class CreateAssets < ActiveRecord::Migration[6.1]
  def change
    create_table :assets do |t|
      t.references :user, null: false, foreign_key: true
      t.string :bigchain_id, null: false
      t.string :bigchain_create_transaction_id, null: false
      t.jsonb :bigchain_create_transaction_outputs, null: false

      t.timestamps
    end
  end
end
