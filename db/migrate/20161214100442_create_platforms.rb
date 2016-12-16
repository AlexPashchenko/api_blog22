class CreatePlatforms < ActiveRecord::Migration[5.0]
  def change
    create_table :platforms do |t|
      t.string :devise_name
      t.integer :user_id
      t.timestamps
    end
  end
end
