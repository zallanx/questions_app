class AddCounterCacheToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :answers_count, :integer, :default => 0
    Question.find_each do |q|
    	q.update_attribute(:answers_count, q.answers.count)
    	q.save
    end
  end
end
