class IngredientsController < ApplicationController
  before_action :require_authenticated_user

  def index
    @ingredients = Ingredient.paginate(page: params[:page], per_page: 5)
                             .includes(:recipes)
  end
end
