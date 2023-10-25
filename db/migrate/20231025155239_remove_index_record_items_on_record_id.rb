class RemoveIndexRecordItemsOnRecordId < ActiveRecord::Migration[7.1]
  def change
    remove_index :record_items, :record_id
  end
end
