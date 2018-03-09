class CommentsController < ApplicationController
  before_action :set_recipe

  def index
    @comments = @recipe.comments
    respond_to do |f|
      f.html {render 'index.html', :layout => false}
      f.json {render json: @comments}
    end
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = @recipe.comments.build(comments_params)
    if @comment.save
      #@ingredients = @recipe.ingredients.all
      redirect_to @recipe
    else
      render "recipes/show"
    end
  end

  private
  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def comments_params
    params.require(:comment).permit(:body, :recipe_id)
  end
end
