class IngredientsController < ApplicationController
  before_action :require_authenticated_user, except: %i[index show]
  before_action :set_ingredient, only: %i[show]

  def index
    @ingredients = Ingredient.all.includes(:recipes)
  end

  def show
    fresh_when(@ingredient)
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      flash[:success] = 'Ingredient created successfully'
      redirect_to @ingredient
    else
      logger.debug "Ingredient errors #{@ingredient.errors.full_messages}"
      render 'new'
    end
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end

  def set_ingredient
    @ingredient = Ingredient.includes(:recipes).find(params[:id])
  end
end
