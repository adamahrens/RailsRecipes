App.comments = App.cable.subscriptions.create "CommentsChannel",
  connected: ->
    console.log('Comments#connected')

  disconnected: ->
    console.log('Comments#disconnected')

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    console.log('Comments#received')
    # Append the rendered partial
    $('#comments').prepend(data)
    # clear out form to submit again
    $('#comment_description').val(null)
