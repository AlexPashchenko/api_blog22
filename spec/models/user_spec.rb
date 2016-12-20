require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Associations' do
    it { should have_many(:posts) }
    it { should have_many(:comments) }
    it { should have_many(:platforms) }
    it { should have_many(:devises) }

  end
  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:login) }
    it { should validate_presence_of(:age) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:role) }
    it { should validate_presence_of(:password) }
  end



end
