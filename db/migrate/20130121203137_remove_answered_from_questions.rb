class RemoveAnsweredFromQuestions < ActiveRecord::Migration
  def up
    remove_column :questions, :answered
  end

  def down
    add_column :questions, :answered, :string
  end
end
