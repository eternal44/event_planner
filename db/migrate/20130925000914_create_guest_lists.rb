class CreateGuestLists < ActiveRecord::Migration
  def change
    create_table :guest_lists do |t|
      t.references :user
      t.references :event

      t.timestamps
    end
    add_index :guest_lists, :user_id
    add_index :guest_lists, :event_id
  end
end
