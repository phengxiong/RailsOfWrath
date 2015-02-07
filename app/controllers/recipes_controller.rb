class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def find_avg_rating (rating, count)
    return rating / count
  end

  def index

    ids = Recipe.pluck(:id) #return an array of ids where rating was 5
    @random_five = Recipe.find(ids).first(5)

    @recipes = Recipe.all.page params[:page]
    respond_with(@recipes)
  end

  def show
    @recipes = Recipe.all.page params[:page]
    respond_with(@recipe)
  end

  def new
    @recipe = Recipe.new
    respond_with(@recipe)
  end

  def edit
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.save
    respond_with(@recipe)
  end

  def update
    @recipe.update(recipe_params)
    respond_with(@recipe)
  end

  def destroy
    @recipe.destroy
    respond_with(@recipe)
  end

  private
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def recipe_params
      params.require(:recipe).permit(:user_id, :title, :serving_size, :directions, :picture, :ingredients, :category, :cook_time, :prepare_time)
    end
end
