module PagesHelper
  def name_for_review(user)
    current_user == user ? "You" : user.full_name
  end
end
