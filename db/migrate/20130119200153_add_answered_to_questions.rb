class AddAnsweredToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :answered, :string
  end
end
