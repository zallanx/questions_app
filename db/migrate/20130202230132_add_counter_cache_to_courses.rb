class AddCounterCacheToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :questions_count, :integer, :default => 0
    Course.find_each do |course|
    	course.update_attributes(:questions_count => course.questions.length)	
    end
  end
end
