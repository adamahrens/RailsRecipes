App.likes = App.cable.subscriptions.create "LikesChannel",
    connected: ->
      console.log('Likes#connected')

    disconnected: ->
      console.log('Likes#disconnected')

    received: (data) ->
      # Called when there's incoming data on the websocket for this channel
      console.log('Likes#received')
      $('#recipe-likes-count').text(data)
