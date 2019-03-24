require 'rails_helper'

RSpec.describe Comment, :type => :model do

  describe 'Respond to fields' do
    it { should respond_to(:body)}
  end

  describe 'should not be valid' do 
    comment = Comment.new
        
    it 'if user_id is nil' do 
      comment.user_id = nil
      expect(comment).to_not be_valid  
    end

    it 'if post_id is nil' do 
      comment.post_id = nil
      expect(comment).to_not be_valid  
    end
    
  end

  describe Comment do
    it { expect(Comment.reflect_on_association(:user).macro).to eq(:belongs_to) }
    it { expect(Comment.reflect_on_association(:post).macro).to eq(:belongs_to) }
  end
end