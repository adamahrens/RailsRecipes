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
    @chefs = Chef.all
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      flash[:success] = 'Recipe created successfully'
      redirect_to recipe_path(@recipe)
    else
      flash[:danger] = 'Recipe contained errors'
      render 'new'
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :chef_id)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
