require 'rails_helper'

describe Business do
  it { should belong_to(:user) }
  it { should have_many(:reviews) }
end
