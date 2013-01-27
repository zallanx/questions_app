class AddAcceptedAnswerIdToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :accepted_answer_id, :integer
  end
end
