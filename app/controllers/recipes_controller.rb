# frozen_string_literal: true

# Recipes Controller for CRUD operations on Recipe
class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]
  before_action :set_chefs, only: %i[new edit]
  before_action :require_authenticated_user
  before_action :validate_current_chef, only: %i[edit update destroy]

  def index
    @recipes = Recipe.all
    fresh_when(@recipes)
  end

  def show
    fresh_when(@recipe)
  end

  def edit
    logger.debug "Recipe errors #{@recipe.errors.full_messages}"
  end

  def update
    if @recipe.update(recipe_params)
      flash[:success] = 'Recipe updated successfully'
      redirect_to recipe_path(@recipe)
    else
      logger.debug "Recipe errors #{@recipe.errors.full_messages}"
      @chefs = Chef.all
      render 'edit'
    end
  end

  def new
    @recipe = Recipe.new
    fresh_when(@chefs)
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      flash[:success] = 'Recipe created successfully'
      redirect_to recipe_path(@recipe)
    else
      logger.debug "Recipe errors #{@recipe.errors.full_messages}"
      @chefs = Chef.all
      render 'new'
    end
  end

  def destroy
    @recipe.destroy
    flash[:success] = 'Recipe was deleted'
    redirect_to recipes_path
  end

  private

  def validate_current_chef
    return unless @recipe.chef != current_chef

    flash[:danger] = 'You dont own the Recipe'
    redirect_to recipes_path
  end

  def recipe_params
    params.require(:recipe).permit(:name, :description, :chef_id)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def set_chefs
    @chefs = Chef.all
  end
end
