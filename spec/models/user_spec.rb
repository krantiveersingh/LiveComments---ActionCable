require 'rails_helper'

RSpec.describe User, :type => :model do

  # before(:each) { @user = User.new }

  describe 'Respond to fields' do
    it { should respond_to(:email)}
  end

  describe 'should not be valid' do 
    user = User.new
        
    it 'if email is nil' do 
      user.email = nil
      expect(user).to_not be_valid  
    end

    it 'if password is nil' do 
      user.password = nil
      expect(user).to_not be_valid  
    end
    
  end

  describe User do
    it { expect(User.reflect_on_association(:posts).macro).to eq(:has_many) }
    it { expect(User.reflect_on_association(:comments).macro).to eq(:has_many) }
  end
end