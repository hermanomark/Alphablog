class CreateArticleCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :article_categories do |t|
      t.integer :article_id
      t.integer :category_id
      # not gonna use timestamps but if you want to could do it
    end
  end
end
