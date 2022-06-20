class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.float :latitude,            :limit => 53, :null => false
      t.float :longtitude,          :limit => 53, :null => false
      t.float :kilometers_traveled, :limit => 53, :null => false
      t.belongs_to :model, index: true, foreign_key: true
      t.timestamps
    end
  end
end

