class ChangeColumnsNamesSearches < ActiveRecord::Migration[5.0]
  def change
    rename_column :searches, :kosher, :treenutfree
    rename_column :searches, :paleo, :peanutfree
  end
end
