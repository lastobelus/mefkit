class AddTokensAndNamesToIdentities < ActiveRecord::Migration[6.0]
  def change
    add_column :identities, :access_token, :string
    add_column :identities, :refresh_token, :string
    add_column :identities, :name, :string
    add_column :identities, :email, :string
    add_column :identities, :nickname, :string
    add_column :identities, :image, :string
    add_column :identities, :phone, :string
    add_column :identities, :urls, :text
  end
end
