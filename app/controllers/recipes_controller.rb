class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  respond_to :html, :js


  def ajax_sum


    id = params["recipe_id"].to_i
    a = Recipe.find(id).shared += 1
    a.save

    result = "added shared to table boi!!"

    respond_to do |format|
      format.json {render :json => {:result => result}}
      end
  end

  def favorites

    @shared = 0
    @shared_recipe = Recipe.find_by_id(params[:id]) #get the id from the url hash
    #a = Recipe.find(id).shared += 1
    @shared_recipe.increment(:shared)
    @shared_recipe.save

    redirect_to "/recipes/#{@shared_recipe.id}"
  end

  def index

    ids = Recipe.pluck(:id) #return an array of ids where rating was 5
    @random_five = Recipe.find(ids).first(5)

    @recipes = Recipe.all.page params[:page]
    respond_with(@recipes)
  end

  def show

    @shared_count = Recipe.find(params[:id]).shared
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
