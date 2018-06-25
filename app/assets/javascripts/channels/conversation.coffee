jQuery(document).on 'turbolinks:load', ->
  $new_message_form = $('#new_message')
  $new_message_body = $new_message_form.find('#message-body')
  
  if (App.chat) 
    App.cable.subscriptions.remove(App.chat)
  if $new_message_form.length > 0
    App.chat = App.cable.subscriptions.create {
      channel: "ChatChannel", conversation_id: $('#frame').data('conversation-id')
      },
      connected: ->
        console.log 'connnected'

      disconnected: ->

      received: (data) ->
        apendToChatBox(data)

      send_message: (message) ->
        @perform 'send_message', message: message