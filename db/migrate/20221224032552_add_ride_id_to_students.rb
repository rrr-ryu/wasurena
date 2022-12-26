class AddRideIdToStudents < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :ride_id, :integer
    add_column :students, :attend_id, :integer
  end
end
