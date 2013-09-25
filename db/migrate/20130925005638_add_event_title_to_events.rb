class AddEventTitleToEvents < ActiveRecord::Migration
  def change
    add_column :events, :event_title, :string
  end
end
