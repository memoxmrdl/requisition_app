require 'rails_helper'

RSpec.describe Requisition, type: :model do
  let(:user) { create(:user, :with_profile) }
  let(:requisition) { create(:requisition, user: user) }

  it 'should be valid' do
    expect(requisition).to be_valid
  end

  it 'should be invalid' do
    requisition = Requisition.new

    expect(requisition).to be_invalid
  end
end
