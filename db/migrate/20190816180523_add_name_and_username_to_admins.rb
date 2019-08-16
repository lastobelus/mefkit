class AddNameAndUsernameToAdmins < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :name, :string
    add_column :admins, :username, :string
  end
end
