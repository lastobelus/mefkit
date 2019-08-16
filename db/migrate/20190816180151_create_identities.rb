class CreateIdentities < ActiveRecord::Migration[5.2]
  def change
    create_table :identities do |t|
      t.references :identifiable, polymorphic: true
      t.string :uid
      t.string :provider

      t.timestamps
    end
  end
end
