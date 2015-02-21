class CreateCategoryArticles < ActiveRecord::Migration
  def change
    create_table :category_articles do |t|
      t.integer :category_id
      t.integer :article_id
      t.timestamps null: false
    end
  end
end
