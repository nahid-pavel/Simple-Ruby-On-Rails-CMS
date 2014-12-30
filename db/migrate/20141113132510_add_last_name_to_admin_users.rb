class AddLastNameToAdminUsers < ActiveRecord::Migration
  def change
    add_column :admin_users, :last_name, :string
  end
end
