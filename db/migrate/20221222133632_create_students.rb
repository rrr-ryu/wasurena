class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :last_name,        null: false
      t.string :first_name,       null: false
      t.integer :team_id
      t.integer :pickup_id
      t.references :room,         null: false, foreign_key: true
      t.timestamps
    end
  end
end
