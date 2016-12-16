class RenameDevisePlatformToPlatformName < ActiveRecord::Migration[5.0]
  def change
    rename_column :platforms, :devise_name, :platform_name
  end
end
