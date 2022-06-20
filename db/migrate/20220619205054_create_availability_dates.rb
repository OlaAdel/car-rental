class CreateAvailabilityDates < ActiveRecord::Migration[7.0]
  def change
    create_table :availability_dates do |t|
      t.timestamp :available_from,                :null => false
      t.timestamp :available_to,                  :null => false
      t.belongs_to :car, index: true, foreign_key: true
      t.boolean :reserved, :default => false, :null => false
      t.timestamps
    end
  end
end
