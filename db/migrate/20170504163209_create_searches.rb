class CreateSearches < ActiveRecord::Migration[5.0]
  def change
    create_table :searches do |t|
      t.belongs_to :user
      t.string :keyword
      t.boolean :vegan, :default => false
      t.boolean :kosher, :default => false
      t.boolean :vegetarian, :default => false
      t.boolean :paleo, :default => false
      t.timestamps
    end
  end
end
