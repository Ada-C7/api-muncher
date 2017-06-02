class FixSearchColumnsForHealth < ActiveRecord::Migration[5.0]
  def change
    remove_column :searches, :gluten
    remove_column :searches, :dairy
    remove_column :searches, :vegetarian
    remove_column :searches, :kosher
    add_column :searches, :health, :string
  end
end
