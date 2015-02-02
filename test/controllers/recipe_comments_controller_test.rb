require 'test_helper'

class RecipeCommentsControllerTest < ActionController::TestCase
  setup do
    @recipe_comment = recipe_comments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recipe_comments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recipe_comment" do
    assert_difference('RecipeComment.count') do
      post :create, recipe_comment: { author: @recipe_comment.author, opinion: @recipe_comment.opinion, rating: @recipe_comment.rating, recipe_id: @recipe_comment.recipe_id }
    end

    assert_redirected_to recipe_comment_path(assigns(:recipe_comment))
  end

  test "should show recipe_comment" do
    get :show, id: @recipe_comment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @recipe_comment
    assert_response :success
  end

  test "should update recipe_comment" do
    patch :update, id: @recipe_comment, recipe_comment: { author: @recipe_comment.author, opinion: @recipe_comment.opinion, rating: @recipe_comment.rating, recipe_id: @recipe_comment.recipe_id }
    assert_redirected_to recipe_comment_path(assigns(:recipe_comment))
  end

  test "should destroy recipe_comment" do
    assert_difference('RecipeComment.count', -1) do
      delete :destroy, id: @recipe_comment
    end

    assert_redirected_to recipe_comments_path
  end
end
