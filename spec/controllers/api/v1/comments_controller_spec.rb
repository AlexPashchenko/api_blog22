require 'rails_helper'
require 'spec_helper'

RSpec.describe Api::V1::CommentsController, type: :controller do
  let(:user) {create(:user)}
  let(:comment) {create (:comment)}
  let(:post) {create (:post)}
  #
  # describe  "GET#" do
  #   let(:post) {create (:post)}
  #   let(:comment) {create (:comment)}
  #    context "index" do
  #      it "render all post.comments with status 200" do
  #        get :index
  #        expect(response).to have_http_status(:ok)
  #      end
  #
  #    end
  # end
end
