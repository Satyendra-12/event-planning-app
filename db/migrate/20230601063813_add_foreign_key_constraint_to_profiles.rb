class AddForeignKeyConstraintToProfiles < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :profiles, :users, on_delete: :cascade
  end
end
