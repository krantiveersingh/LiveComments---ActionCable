class CommentBroadcastJob < ApplicationJob
  queue_as :default

  def perform(comment_id)
  	comment = Comment.find_by(id: comment_id)
    ActionCable.server.broadcast "post_#{comment.post_id}_channel",
                                 comment: render_comment(comment)
  end

  private

  def render_comment(comment)
    CommentsController.render partial: 'comments/comment', locals: { comment: comment }
  end
end