class AddCourseIDtoQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :course_id, :integer #table name, column name, column type
  end
end
