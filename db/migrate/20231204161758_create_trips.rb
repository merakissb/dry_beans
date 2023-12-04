class CreateTrips < ActiveRecord::Migration[7.0]
  def change
    create_table :trips do |t|
      t.references :route, null: false, foreign_key: true

      t.string :name, null: false
      t.integer :status, null: false, default: 0
      t.datetime :date, null: false

      t.timestamps
    end
  end
end
