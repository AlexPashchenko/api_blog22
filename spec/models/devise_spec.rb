require 'rails_helper'

RSpec.describe Devise, type: :model do
  it { should validate_presence_of(:devise_name) }
  it { should validate_presence_of(:platform_id) }
  it {should validate_uniqueness_of(:token)}
  it { should respond_to(:token) }

  it "has a valid factory" do
    expect(create(:devise)).to be_valid
  end
end
