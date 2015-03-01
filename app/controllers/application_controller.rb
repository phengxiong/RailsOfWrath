class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?
  protected

  def configure_permitted_parameters

  devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :newsletter, :password, :password_confirmation, :avatar, :avatar_file_path, :appetizer, :breakfast, :lunch, :chicken, :dessert, :healthy, :main_dish, :slow_cooker, :vegetarian) }
  devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :newsletter, :password, :password_confirmation, :current_password, :avatar, :avatar_file_path, :appetizer, :breakfast, :lunch, :chicken, :dessert, :healthy, :main_dish, :slow_cooker, :vegetarian) }
  end



end
