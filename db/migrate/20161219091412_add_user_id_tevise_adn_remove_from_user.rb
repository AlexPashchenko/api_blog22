class AddUserIdTeviseAdnRemoveFromUser < ActiveRecord::Migration[5.0]
  def change
    add_column :devises, :user_id, :integer
    remove_column :users, :user_id
  end
end
