require 'rails_helper'

describe User do
  it { should have_many(:reviews) }

  describe "#full_name" do
    it "returns the first and last name" do
      serina = Fabricate(:user)
      expect(serina.full_name).to eq("#{serina.first_name} #{serina.last_name}")
    end
  end
end
