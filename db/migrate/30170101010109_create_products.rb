class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :pcolor
      t.references :country_of_origin, foreign_key: true
      t.datetime :pdate
      t.integer :active_status
      t.integer :sort_order
      t.timestamps
    end
  end
end
