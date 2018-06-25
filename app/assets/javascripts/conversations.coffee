$(document).on "turbolinks:load", ->
  autocomplete = $("[data-behavior='conversation-partners-autocomplete']").autocomplete(
    source: "/conversations/partners_autocomplete",
    minlength: 0
    select: (event, ui) ->
      $("#user_id").val(ui.item.name)
      $("[data-behavior='conversation-submit-button']").prop('disabled', false)
    )

  tags_options = { maximumSelectionLength: 4 }
  $('.top-filter .states').select2(
    $.extend(tags_options, { placeholder: "Filter by states" })
  ).on 'select2:select select2:unselect', ->
    filterConversationList({states: $(this).val()})

  $('.top-filter .positions').select2(
    $.extend(tags_options, { placeholder: "Filter by poistions" })
  ).on 'select2:select select2:unselect', ->
    filterConversationList({positions: $(this).val()})

  $('#name-filter').keyup ->
    filterConversationList({name: $(this).val()})

  $('#send-msg').click ->
    sendMessage()

  $('#message-body').keypress (e)->
    if e.keyCode == 13
      sendMessage()

  $(".messages").animate({ scrollTop: $('.messages').prop("scrollHeight")}, 1000);

  $.get '/update_online_time'
  setInterval (->
    $.get '/update_online_time'
    return
  ), 60 * 1000

sendMessage=->
  msg = $('#message-body').val()
  $('#message-body').val('')
  App.chat.send_message(msg)
  up_top_active_conversation()

filterConversationList=(hash)->
  contactsPanel = $('#contacts')
  contactsPanel.find('.contact').each (i, e)->
    $(e).show()
    if hash.hasOwnProperty('name')
      unless $(e).data('name').toLowerCase().includes(hash['name'].toLowerCase())
        $(e).hide()

    if hash.hasOwnProperty('states')
      state = $(e).data('state')
      if hash['states'].length && !hash['states'].includes(state)
        $(e).hide()

    if hash.hasOwnProperty('positions')
      position = $(e).data('position')
      if hash['positions'].length && !hash['positions'].includes(position)
        $(e).hide()

@apendToChatBox=(data)->
  messages = $('.messages ul')
  currentUser = $('#frame').data('user-id')

  if $('.message-thread').length
    if data.user_id == parseInt(currentUser)
      messageHTML = "<li class='clearfix message_right'><span class='message-author'>#{data.user_name}</span><p>#{data.message}</p></li>"
    else
      messageHTML = "<li class='clearfix'><span class='message-author'>#{data.user_name}</span><p>#{data.message}</p></li>"
  else
    if data.user_id == parseInt(currentUser)
      messageHTML = "<li class='replies'><a href='#'><img src='#{data.avatar}'></a><p>#{data.message}</p></li>"
    else
      messageHTML = "<li class='sent'><a href='/athletes/#{data.user_id}/connections'><img src='#{data.avatar}'/></a><p>#{data.message}</p></li>"

  messages.append(messageHTML)
  $(".messages").animate({ scrollTop: $('.messages').prop("scrollHeight")}, 1000);

up_top_active_conversation=->
  list = $('#contacts ul');
  active = list.find('li.active')

  list.prepend(active.clone())
  active.remove()