# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

def admin_do?(current_user)
  if current_user.has_role?("admin") or current_user.has_role?("manager")
    return true
  else
    return false
  end
end





end

