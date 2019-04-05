class CreateMattresses < ActiveRecord::Migration[5.2]
  def change
    create_table :mattresses do |t|
      t.text :model
      t.integer :quality
      t.references :brand
    end
  end
end
