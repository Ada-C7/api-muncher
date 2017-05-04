class CreateSearches < ActiveRecord::Migration[5.0]
  def change
    create_table :searches do |t|
      t.belongs_to :user
      t.string :keyword
      t.string :vegan
      t.string :kosher
      t.string :vegetarian
      t.string :paleo
      t.timestamps
    end
  end
end
