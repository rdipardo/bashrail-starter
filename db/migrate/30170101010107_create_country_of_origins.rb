class CreateCountryOfOrigins < ActiveRecord::Migration[5.2]
  def change
    create_table :country_of_origins do |t|
      t.string :name
      t.string :ctype
      t.datetime :fdate
      t.integer :active_status
      t.integer :sort_order

      t.timestamps
    end
  end
end
