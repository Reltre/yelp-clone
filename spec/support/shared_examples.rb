module SharedExamples
  shared_examples "require_log_in" do
    it "redirects to the sign in page" do
      clear_current_user
      action
      expect(response).to redirect_to sign_in_path
    end
  end
end
