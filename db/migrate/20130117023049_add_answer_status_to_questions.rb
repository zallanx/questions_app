class AddAnswerStatusToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :answer_status, :boolean
  end
end
