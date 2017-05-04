class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.belongs_to :user
      t.string :name
      t.string :recipe_uri

      t.timestamps
    end
  end
end
