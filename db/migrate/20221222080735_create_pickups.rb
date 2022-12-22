class CreatePickups < ActiveRecord::Migration[6.0]
  def change
    create_table :pickups do |t|
      t.string :name,             null: false
      t.references :room,         null: false, foreign_key: true
      t.timestamps
    end
  end
end
