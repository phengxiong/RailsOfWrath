class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  respond_to :html, :js


  def favorites

    @shared = 0
    @shared_recipe = Recipe.find_by_id(params[:id]) #get the id from the url hash
    #a = Recipe.find(id).shared += 1
    @shared_recipe.increment(:shared)
    @shared_recipe.save

    redirect_to "/recipes/#{@shared_recipe.id}"
  end

  def index
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

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe }
        format.json { render :show, status: :created, location: @recipe }

        User.all.each do |user|
          if (user.appetizer == true && @recipe.category == "Appetizer")
            UserMailer.recipe_email(@recipe, user).deliver
          end

          if (user.breakfast == true && @recipe.category == "Breakfast")
            UserMailer.recipe_email(@recipe, user).deliver
          end

          if (user.lunch == true && @recipe.category == "Lunch")
            UserMailer.recipe_email(@recipe, user).deliver
          end

          if (user.chicken == true && @recipe.category == "Chicken")
            UserMailer.recipe_email(@recipe, user).deliver
          end

          if (user.healthy == true && @recipe.category == "Healthy")
            UserMailer.recipe_email(@recipe, user).deliver
          end

          if (user.main_dish == true && @recipe.category == "Main Dish")
            UserMailer.recipe_email(@recipe, user).deliver
          end

          if (user.slow_cooker == true && @recipe.category == "Slow Cooker")
            UserMailer.recipe_email(@recipe, user).deliver
          end

          if (user.vegetarian == true && @recipe.category == "Vegetarian")
            UserMailer.recipe_email(@recipe, user).deliver
          end

        end
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
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
    params.require(:recipe).permit(:user_id, :title, :serving_size, :directions, :description, :picture, :ingredients, :category, :cook_time, :prepare_time, :youtube)
  end
end
