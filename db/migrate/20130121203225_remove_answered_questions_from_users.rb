class RemoveAnsweredQuestionsFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :answered_questions
  end

  def down
    add_column :users, :answered_questions, :integer
  end
end
