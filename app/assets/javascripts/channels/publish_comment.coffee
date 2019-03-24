jQuery(document).on 'turbolinks:load', ->
	comments = $('#comments_list')

	if $('#comments_list').length > 0

		App.publish_comment = App.cable.subscriptions.create {
        channel: "PublishCommentChannel"
        post_id: comments.data('post-id')
      },
		  connected: ->
		  	console.log('connected') 
		    # Called when the subscription is ready for use on the server

		  disconnected: ->
		  	console.log('disconnected')
		    # Called when the subscription has been terminated by the server

		  received: (data) ->
		    # Called when there's incoming data on the websocket for this channel
		  	console.log(data)
		  	comments.append data['comment']

		  send_comment: (comment, post_id) ->
        @perform 'send_comment', comment: comment, post_id: post_id

      $('#new_comment').submit (e) ->
      	$this = $(this)
	      textarea = $this.find('.comment_body')
	      if $.trim(textarea.val()).length > 1
	        App.publish_comment.send_comment textarea.val(), comments.data('post-id')
	        textarea.val('')
	      e.preventDefault()

	      return false