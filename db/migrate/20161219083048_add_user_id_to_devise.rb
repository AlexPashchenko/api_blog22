class AddUserIdToDevise < ActiveRecord::Migration[5.0]
  def change
    add_column :devise, :user_id, :integer
  end
end
