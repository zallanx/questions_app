class AddAnsweredQuestionsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :answered_questions, :integer
  end
end
