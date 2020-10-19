class CreateExamples < ActiveRecord::Migration[5.2]
  def change
    create_table :examples do |t|
      t.string :name
      t.string :color
      t.integer :active_status
      t.integer :sort_order

      t.timestamps
    end
  end
end
