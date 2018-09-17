class AddColumnDescriptionToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :description, :text
    #adding timestamps, in orginal migration file you can add t.timestamps it will create created_at and updated_at
    add_column :articles, :created_at, :datetime
    add_column :articles, :updated_at, :datetime
  end
end
