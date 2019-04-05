class CreateBrand < ActiveRecord::Migration[5.2]
  def change
    create_table :brands do |t|
      t.text :name
    end
  end
end
