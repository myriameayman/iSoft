class CreateReplyToComments < ActiveRecord::Migration
  def change
    create_table :reply_to_comments do |t|
      t.string :commenter
      t.text :body
      t.reference :comment , index: true

      t.timestamps null: false
    end
  end
end

