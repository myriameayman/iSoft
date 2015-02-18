class AddCommentIdToReplies < ActiveRecord::Migration
  def change
    add_column :replies, :comment_id, :integer
  end
end
