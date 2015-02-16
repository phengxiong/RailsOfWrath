module ApplicationHelper

  def is_admin?
    return current_user.try(:admin?)
  end
  
  def resource_name

    :user

  end

  def resource

    @resource ||= User.new

  end

  def devise_mapping

    @devise_mapping ||= Devise.mappings[:user]

  end



end
