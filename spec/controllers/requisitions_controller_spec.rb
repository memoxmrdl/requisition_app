require 'rails_helper'

RSpec.describe RequisitionsController, type: :controller do
  login_user_with_profile

  describe "#index" do
    let(:requisitions) { create_list(:requisition, 5, user: @user) }

    before(:each) do
      requisitions

      get :index
    end

    it 'returns http success' do
      expect(response).to be_success
    end

    it 'should be render template index' do
      expect(response).to render_template(:index)
    end

    it 'should have five requisitions on the list' do
      expect(assigns[:requisitions]).to match_array(requisitions)
    end
  end

  describe "#new" do
    before(:each) do
      get :new
    end

    it 'returns http success' do
      expect(response).to be_success
    end

    it 'should be render template index' do
      expect(response).to render_template(:new)
    end
  end

  describe "#create" do
    let(:requisition_params) do
      attributes_for(:requisition).merge(personal_references_attributes: attributes_for_list(:personal_reference, 3))
    end

    before(:each) do
      post :create, requisition: requisition_params
    end

    it 'should be redirect' do
      expect(response).to redirect_to(requisitions_path)
    end

    it 'should be created' do
      expect(assigns[:requisition]).to be_persisted
    end
  end

  describe "#edit" do
    let(:requisition) { create(:requisition_with_personal_references, user: @user) }

    before(:each) do
      get :edit, id: requisition
    end

    it 'returns http success' do
      expect(response).to be_success
    end

    it 'should be render template index' do
      expect(response).to render_template(:edit)
    end
  end

  describe "#update" do
    let(:requisition) { create(:requisition_with_personal_references, user: @user) }
    let(:requisition_update_params) {
      { income: 10000.0 }
    }

    before(:each) do
      put :update, id: requisition, requisition: requisition_update_params
    end

    it 'should be redirect' do
      expect(response).to redirect_to(requisitions_path)
    end

    it 'should be updated' do
      expect(assigns[:requisition].income).to eql requisition_update_params[:income]
    end
  end
end
