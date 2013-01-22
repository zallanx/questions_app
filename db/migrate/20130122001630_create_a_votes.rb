class CreateAVotes < ActiveRecord::Migration
  def change
    create_table :a_votes do |t|
      t.integer :user_id
      t.integer :answer_id
      t.boolean :up

      t.timestamps
    end
  end
end
