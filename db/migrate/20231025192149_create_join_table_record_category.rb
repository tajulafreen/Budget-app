class CreateJoinTableRecordCategory < ActiveRecord::Migration[7.1]
  def change
    create_join_table :records, :categories do |t|
      t.index :record_id
      t.index :category_id
    end
  end
end
