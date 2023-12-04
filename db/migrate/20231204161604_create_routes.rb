class CreateRoutes < ActiveRecord::Migration[7.0]
  def change
    create_table :routes do |t|
      t.string :name, null: false
      t.integer :status, null: false, default: 0
      t.datetime :date, null: false

      t.timestamps
    end
  end
end
