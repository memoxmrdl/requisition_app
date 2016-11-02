require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build_stubbed(:user) }

  it 'should be valid' do
    expect(user).to be_valid
  end

  it 'should be invalid' do
    user = User.new

    expect(user).to be_invalid
  end
end
