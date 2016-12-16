require 'rails_helper'

RSpec.describe Comment, type: :model do

  it { should validate_presence_of(:text) }
  it { should validate_presence_of(:post_id) }
  it { should validate_presence_of(:user_id) }
  it { should belong_to(:user) }
  it { should belong_to(:post) }



  # describe "validation" do
  #
  #   context "without text" do
  #     let(:comment) { Comment.new(user_id:1, post_id:1) }
  #     it "should not be valid" do
  #       expect(comment.valid?).to be_falsey
  #       expect(comment.errors).to be_present
  #       expect(comment.errors.messages[:text]).to be_present
  #     end
  #   end
  #   context "without user" do
  #     let(:comment) { Comment.new(text:"1dfjks", post_id:1) }
  #     it "should not be valid" do
  #       expect(comment.valid?).to be_falsey
  #       expect(comment.errors).to be_present
  #       expect(comment.errors.messages[:user_id]).to be_present
  #     end
  #   end
  #   context "without post" do
  #     let(:comment) { Comment.new(text:"1dfjks", user_id:1) }
  #     it "should not be valid" do
  #       expect(comment.valid?).to be_falsey
  #       expect(comment.errors).to be_present
  #       expect(comment.errors.messages[:post_id]).to be_present
  #     end
  #   end
  # end
end

