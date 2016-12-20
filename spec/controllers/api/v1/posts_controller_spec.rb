require 'rails_helper'
require 'spec_helper'
require 'factory_girl'

RSpec.describe Api::V1::PostsController, type: :controller do


  describe "GET#" do
    let(:post) { create(:post, status: 'approved') }
    let(:post_non_approve) { create(:post, status: 'unapproved') }
    let(:user) { create(:user) }
    context "index" do

      it "render all posts with status 200" do
        get :index
        expect(response).to have_http_status(:ok)
      end
    end

    context "show" do

      it "render @post if post is found" do
        get :show, { params: {id: post.id}}
        expect(response).to have_http_status(:ok)
      end

      it " @post not found" do
        assert_raises(ActiveRecord::RecordNotFound) do
          get :show, { params: {id: 531654643}}
        end
      end
      it " @post is unapproved" do
        get :show, { params: {id: post_non_approve.id}}
        expect(response).to have_http_status(404)

      end
    end
  end
  describe "POST#create" do
    let(:created_post) { create(:post)}

    context "create a new post" do

      it "correct creating" do
        post :create,  {params:{post: attributes_for(:post)}}
        expect(response).to have_http_status(201)
      end

      it "responds with 422" do
        post :create, {params:{post: attributes_for(:post, text: nil)}}
        expect(response).to have_http_status(422)
      end

    end

  end
  describe "DELETE#" do
    let(:post) { create(:post, status: 'approved')  }
    context "destroy" do

      it " action successful" do
        delete :destroy,  { params: {id: post.id}}
        expect(response).to have_http_status(:ok)
      end

      it " action not successful" do
        assert_raises(ActiveRecord::RecordNotFound) do
          delete :destroy,  { params: {id: 531654643}}
        end
      end

    end
  end

  describe "PUT#" do
    let(:text) { "new text" }
    let(:post) {create(:post, status: 'approved') }
    context "update" do

      it "correct updating" do
        put :update,  {params:{id: post.id, post: {text: text }}}
        expect(response).to have_http_status(:ok)
      end
      it "not correct updating" do
        put :update, {params:{id: post.id, post: {text: nil}}}
        expect(response).to have_http_status(422)
      end
    end
  end

end