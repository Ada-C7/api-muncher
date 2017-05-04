class ChangeSearchesTable < ActiveRecord::Migration[5.0]
  def change
    change_column :searches, :vegan,  'boolean USING CAST(vegan AS boolean)'
    change_column :searches, :kosher, 'boolean USING CAST(kosher AS boolean)'
    change_column :searches, :vegetarian,  'boolean USING CAST(vegetarian AS boolean)'
    change_column :searches, :paleo, 'boolean USING CAST(paleo AS boolean)'

    # change_column :searches, :vegan,  :default => false, 'boolean USING CAST(vegan AS boolean)'
    # change_column :searches, :kosher,:default => false, 'boolean USING CAST(kosher AS boolean)'
    # change_column :searches, :vegetarian, :default => false, 'boolean USING CAST(vegetarian AS boolean)'
    # change_column :searches, :paleo,  :default => false, 'boolean USING CAST(paleo AS boolean)'

    # ALTER TABLE searches ALTER COLUMN vegan TYPE boolean USING (searches::boolean);
  end
end
