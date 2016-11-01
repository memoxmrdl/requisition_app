require 'rails_helper'

RSpec.describe Identity, type: :model do
  let(:user) { create(:user) }
  let(:identity) { create(:identity, user: user) }

  it 'should be valid' do
    expect(identity).to be_valid
  end

  it 'should be invalid' do
    identity = Identity.new

    expect(identity).to be_invalid
  end

  it 'should be a uniqueness identity to user' do
    expect { create(:identity, uid: identity.uid, user: user) }.to raise_error ActiveRecord::RecordInvalid
  end
end
