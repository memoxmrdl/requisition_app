require 'rails_helper'

RSpec.describe Profile, type: :model do
  let(:profile) { build_stubbed(:profile) }

  it 'should be valid' do
    expect(profile).to be_valid
  end

  it 'should be invalid' do
    profile = Profile.new

    expect(profile).to be_invalid
  end
end
