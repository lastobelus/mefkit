class AddAdminsAndIdentitiesTableComments < ActiveRecord::Migration[6.0]
  def change
    change_table_comment :admins, "Admin users. Authentication by devise. Has a shadow user."
    change_table_comment :identities, "Connects an Admin/User to an omniauth provider (git, google, facebook etc.)"
  end
end
