class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :content
      t.integer :type
      t.integer :points

      t.timestamps
    end
  end
end
