class LikesController < ApplicationController
  before_action :require_authenticated_user

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @like = Like.new(recipe: @recipe)
    if @like.save
      count = @recipe.likes.count
      logger.debug 'Like saved'
      ActionCable.server.broadcast(
        'likes',
        count
      )
    else
      flash[:danger] = 'Comment was not created'
      redirect_to :back
    end
  end
end
