require 'rails_helper'

describe Review do
  it { is_expected.to belong_to :business }
  it { is_expected.to belong_to :user }
  it { is_expected.to validate_presence_of :rating }
  it { is_expected.to validate_inclusion_of(:rating).in_range(1..5) }
end
