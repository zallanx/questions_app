class RemoveRememberTokenLstringFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :remember_tokenLstring
  end

  def down
    add_column :users, :remember_tokenLstring, :string
  end
end
