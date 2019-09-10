App.messages = App.cable.subscriptions.create "MessagesChannel",
  connected: ->
    console.log('Messages#connected')

  disconnected: ->
    console.log('Messages#disconnected')

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    console.log('Messages#received')
    # Append the rendered partial
    $('#messages').prepend(data)
    # clear out form to submit again
    $('#message_content').val('')
