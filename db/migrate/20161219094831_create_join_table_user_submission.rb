class CreateJoinTableUserSubmission < ActiveRecord::Migration
  def change
    create_join_table :users, :submissions do |t|
      # t.index [:user_id, :submission_id]
      # t.index [:submission_id, :user_id]
    end
  end
end
