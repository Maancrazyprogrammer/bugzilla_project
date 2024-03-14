# spec/controllers/bugs_controller_spec.rb
require 'rails_helper'

RSpec.describe BugsController, type: :controller do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe "GET /bugs" do
    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end


    it "assigns @q for Ransack search" do
      get :index
      expect(assigns(:q)).to be_present
      expect(assigns(:q)).to be_a(Ransack::Search)
    end

    it "assigns a temporary project_id for the form" do
      get :index
      expect(assigns(:project_id_for_form)).to be_present
    end

    it "authorizes the index action" do
      expect(controller).to receive(:authorize!).with(:index, Bug)
      get :index
    end

    # Add more specs as needed for your specific actions and use cases
  end
end
