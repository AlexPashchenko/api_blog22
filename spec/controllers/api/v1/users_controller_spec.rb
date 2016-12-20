require 'rails_helper'
require 'spec_helper'
RSpec.describe Api::V1::UsersController, type: :controller do

  describe "GET #show" do
    let(:user) { create (:user) }
    it "Response status (200)" do

      get :show, params:{ id: user.id}
      expect(response).to have_http_status(:ok)
    end
  end
  describe "POST #create" do
    let(:created_user) { create(:user)}

    context "create a new user" do

      it "correct creating" do
        post :create,  {params:{user: attributes_for(:user)}}
        expect(response).to have_http_status(201)
      end

      it "responds with 422" do
        post :create, {params:{user: attributes_for(:user, email: nil)}}
        expect(response).to have_http_status(422)
      end

    end

  end
  describe "PUT/PATCH #update" do
    let(:user) { create(:user)}
    let(:email) { "newemail@email.com"}

    it "correct updating" do
      put :update,  params:{id: user.id, user: {email: email}}
      expect(response).to have_http_status(:ok)
    end


    it "renders the json errors on whye the user could not be created" do
      put :update, params:{id: user.id, user: {email: "bademail"}}
      expect(response).to have_http_status(422)
    end

  end
  describe "DELETE #destroy" do
    let(:user) { create(:user)}
    it "Deleting is succesful" do
      delete :destroy, { id: user.id }
      expect(response).to have_http_status(204)
    end

  end
end
