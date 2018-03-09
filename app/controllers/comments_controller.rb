class CommentsController < ApplicationController
  before_action :set_recipe

  def index
    @comments = @recipe.comments
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = @recipe.comments.build(comments_params)
    if @comment.save
      redirect_to recipe_path
    else
      redirect_to new_recipe_comment_path(@recipe)
    end
  end

  private
  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def comments_params
    params.require(:comment).permit(:body)
  end
end
