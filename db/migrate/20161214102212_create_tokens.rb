class CreateTokens < ActiveRecord::Migration[5.0]
  def change
    create_table :tokens do |t|
      t.string :token
      t.string :devise_name
      t.integer :platform_id

      t.timestamps
    end
  end
end
