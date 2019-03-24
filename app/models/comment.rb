class Comment
  include Mongoid::Document
 
  field :body, type: String
  
  belongs_to :user
  belongs_to :post

  after_save { CommentBroadcastJob.perform_later(self.id.to_s) }
end
