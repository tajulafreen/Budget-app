class CreateRecordItems < ActiveRecord::Migration[7.1]
  def change
    create_table :record_items do |t|
      t.references :record, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.timestamps
    end
    add_index :record_items, :record_id  # Add an index on the record_id foreign key
    add_index :record_items, :category_id 
  end
end
