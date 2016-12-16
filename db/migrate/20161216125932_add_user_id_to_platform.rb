class AddUserIdToPlatform < ActiveRecord::Migration[5.0]
  def change
    add_column :platforms, :user_id, :integer
  end
end
