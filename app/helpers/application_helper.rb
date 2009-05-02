# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

def admin_do?(current_user)
  if current_user.has_role?("admin") or current_user.has_role?("manager")
    return true
  else
    return false
  end
end


def link_to_back (description = "Back")
   referer = request.env["HTTP_REFERER"]
   return false if !referer
   getIt = request.env["REQUEST_URI"].split("?")[1]
   if getIt.nil?
     getIt = ""
     else
       getIt = "?" + getIt if !getIt.match(/\?/)
   end
   link_to description, referer + getIt
end


end

