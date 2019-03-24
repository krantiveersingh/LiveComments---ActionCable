class PublishCommentChannel < ApplicationCable::Channel
  def subscribed
    stream_from "post_#{params['post_id']}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_comment(data)
  	current_user.comments.create!(body: data['comment'], post_id: data['post_id'])
  end
end
