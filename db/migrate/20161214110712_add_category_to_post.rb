class AddCategoryToPost < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :category_id, :integer
    remove_column :users, :provider
    remove_column :users, :api_token
  end
end
