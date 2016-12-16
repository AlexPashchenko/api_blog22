require 'rails_helper'

RSpec.describe Post, type: :model do

  it { should validate_presence_of(:text) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:category_id) }
  it { should validate_presence_of(:status) }
  it { should belong_to(:user) }
  it { should belong_to(:category) }
  it { should have_many(:comments) }

  it 'has a valid factory' do
    expect(build(:post)).to be_valid
  end

  it 'is invalid without a year' do
    expect(build(:post, text: nil)).to_not be_valid
  end
end
