class RemoveAnsweredFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :answered
  end

  def down
    add_column :users, :answered, :boolean
  end
end
