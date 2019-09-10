class CommentsController < ApplicationController
  before_action :require_authenticated_user

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @comment = @recipe.comments.build(comment_params)
    @comment.chef = current_chef
    if @comment.save
      ActionCable.server.broadcast(
        'comments',
        render(partial: 'recipes/comment', object: @comment)
      )

      # Realtime dont need flash and redirect
      # flash[:success] = 'Comment created successfully'
      # redirect_to recipe_path(@recipe)
    else
      flash[:danger] = 'Comment was not created'
      redirect_to :back
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:description)
  end
end
