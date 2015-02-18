class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.string :text
      t.comment_id :integer 
      t.timestamps null: false
    end
  end
end
