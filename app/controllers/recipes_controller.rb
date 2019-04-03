# frozen_string_literal: true
# Recipes Controller for CRUD operations on Recipe
class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show]

  def index
    @recipes = Recipe.all
  end

  def show; end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.chef = Chef.first
    if @recipe.save
      flash[:success] = 'Recipe created successfully'
      redirect_to recipe_path(@recipe)
    else
      render 'new'
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
