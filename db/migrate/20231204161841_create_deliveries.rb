class CreateDeliveries < ActiveRecord::Migration[7.0]
  def change
    create_table :deliveries do |t|
      t.references :trip, null: false, foreign_key: true

      t.integer :delivery_type, null: false
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
