class RecipeCommentsController < ApplicationController
  before_action :set_recipe_comment, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @recipe_comments = RecipeComment.all
    respond_with(@recipe_comments)
  end

  def show
    respond_with(@recipe_comment)
  end

  def new
    @recipe_comment = RecipeComment.new
    respond_with(@recipe_comment)
  end

  def edit
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe.recipe_comments.create(recipe_comment_params)
    @recipe.save
    redirect_to recipe_path(@recipe.id)
  end


  def update
    @recipe_comment.update(recipe_comment_params)
    respond_with(@recipe_comment)
  end

  def destroy
    @recipe_comment.destroy
    respond_with(@recipe_comment)
  end

  private
    def set_recipe_comment
      @recipe_comment = RecipeComment.find(params[:id])
    end

    def recipe_comment_params
      params.require(:recipe_comment).permit(:recipe_id, :author, :opinion, :rating)
    end
end
