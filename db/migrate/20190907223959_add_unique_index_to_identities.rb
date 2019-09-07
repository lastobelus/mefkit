class AddUniqueIndexToIdentities < ActiveRecord::Migration[6.0]
  def change
    add_index :identities, [:provider, :uid], unique: true
  end
end
