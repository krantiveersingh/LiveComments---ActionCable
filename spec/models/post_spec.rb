require 'rails_helper'

RSpec.describe Post, :type => :model do

  describe 'Respond to fields' do
    it { should respond_to(:title)}
  end

  describe 'should not be valid' do 
    post = Post.new
        
    it 'if user_id is nil' do 
      post.user_id = nil
      expect(post).to_not be_valid  
    end
    
  end

  describe Post do
    it { expect(Post.reflect_on_association(:user).macro).to eq(:belongs_to) }
    it { expect(Post.reflect_on_association(:comments).macro).to eq(:has_many) }
  end
end