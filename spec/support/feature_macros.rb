module FeatureMacros
  def sign_in(user = nil)
    user ||= Fabricate(:user)
    visit(sign_in_path)
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign In"
  end
end
