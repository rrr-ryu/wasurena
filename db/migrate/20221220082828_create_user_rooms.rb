class CreateUserRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :user_rooms do |t|
      t.references :user, nill: false, foreign_key: true
      t.references :room, nill: false, foreign_key: true
      t.timestamps
    end
  end
end
