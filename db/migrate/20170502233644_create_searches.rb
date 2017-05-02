class CreateSearches < ActiveRecord::Migration[5.0]
  def change
    create_table :searches do |t|
      t.string :search_terms
      t.boolean :gluten, default: false
      t.boolean :dairy, default: false
      t.boolean :vegetarian, default: false
      t.boolean :kosher, default: false
      t.timestamps
    end
  end
end
