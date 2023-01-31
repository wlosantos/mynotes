require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'create user' do
    it 'should create a user' do
      user = FactoryBot.create(:user)
      expect(user).to be_valid
    end

    it 'should not create a user without email' do
      user = FactoryBot.build(:user, email: nil)
      expect(user).to_not be_valid
    end

    it 'should not create a user without password' do
      user = FactoryBot.build(:user, password: nil)
      expect(user).to_not be_valid
    end
  end
end
