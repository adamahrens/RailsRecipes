# frozen_string_literal: true

class CreateJoinTableRecipesIngredients < ActiveRecord::Migration[5.2]
  def change
    create_join_table :recipes, :ingredients do |t|
      t.index %i[recipe_id ingredient_id]
      t.integer :recipe_id
      t.integer :ingredient_id
    end
  end
end
