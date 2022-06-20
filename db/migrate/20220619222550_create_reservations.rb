class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.belongs_to :availability_date, index: true, foreign_key: true
      t.timestamps
    end
  end
end
