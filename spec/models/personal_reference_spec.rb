require 'rails_helper'

RSpec.describe PersonalReference, type: :model do
  let(:personal_reference) { create(:personal_reference) }

  it 'should be valid' do
    expect(personal_reference).to be_valid
  end

  it 'should be invalid' do
    personal_reference = PersonalReference.new

    expect(personal_reference).to be_invalid
  end
end
