class CreateProductFeatures < ActiveRecord::Migration[5.2]
  def change
    create_table :product_features do |t|
      t.string :name
      t.references :product, foreign_key: true
      t.references :pfeature, foreign_key: true
      t.integer :active_status
      t.integer :sort_order

      t.timestamps
    end
  end
end
