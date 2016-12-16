class RemoveUserIdFromPlatform < ActiveRecord::Migration[5.0]
  def change
    remove_column :platforms, :user_id
    add_column :platforms, :session_id, :integer
  end
end
