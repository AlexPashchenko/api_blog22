class RenameTokenToDevise < ActiveRecord::Migration[5.0]
  def change
    rename_table :tokens, :devises

  end
end
