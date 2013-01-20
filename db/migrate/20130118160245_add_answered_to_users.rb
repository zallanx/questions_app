class AddAnsweredToUsers < ActiveRecord::Migration
  def change
    add_column :users, :answered, :boolean
  end
end
