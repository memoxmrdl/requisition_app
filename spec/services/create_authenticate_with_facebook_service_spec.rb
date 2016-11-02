require 'rails_helper'

RSpec.describe CreateAuthenticateWithFacebookService do
  describe "#auth" do
    let(:auth_params) {
      OpenStruct.new(uid: Faker::Code.ean, provider: 'facebook', info: OpenStruct.new(email: Faker::Internet.email),
                     extra: OpenStruct.new(raw_info: OpenStruct.new(name: Faker::Company.name)))
    }

    subject { CreateAuthenticateWithFacebookService.new(auth_params) }

    before(:each) do
      subject.auth
    end

    it 'should have a user' do
      expect(subject.user).to eql User.last
    end

    it 'should have a profile' do
      expect(subject.profile).to eql Profile.last
    end
  end
end
