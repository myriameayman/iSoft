class CreateCategoryArticles < ActiveRecord::Migration
  def change
    create_table :category_articles do |t|
      t.category_id :integer
      t.article_id :integer
      t.timestamps null: false
    end
  end
end
