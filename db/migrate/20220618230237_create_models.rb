class CreateModels < ActiveRecord::Migration[7.0]
  def change
    create_table :models do |t|
      t.string :name,                :null => false
      t.belongs_to :make, index: true, foreign_key: true
      t.timestamps
    end
  end
end
