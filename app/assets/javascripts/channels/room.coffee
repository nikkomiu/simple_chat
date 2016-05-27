# Set word version of time on all messages
time_in_words = (utc) ->
  local_time = moment.utc(utc).toDate()
  return moment(local_time).fromNow()

$('.message_time').each (idx, val) ->
  $(this).html(time_in_words $(this).html())

# Disconnect from subscription when navigating away from page
if window.unsubscribe == undefined
  window.unsubscribe = $(document).on 'turbolinks:before-render', (e) ->
    window.unsubscribe = undefined
    App.cable.subscriptions.subscriptions.forEach (ele, idx, arr) ->
      App.cable.subscriptions.remove ele
      console.log 'Unsubscribing from room'

# Add subscription when arriving on page
App.room = App.cable.subscriptions.create { channel: "RoomChannel", room: $('#room_id').val() },
  connected: ->
    console.log 'Connected to room'

  disconnected: ->
    console.log 'Disconnected from room'

  received: (data) ->
    msg = $(data.message)
    msg_time = msg.find('.message_time')
    msg_time.html(time_in_words(msg_time.html()))
    $('#messages').prepend(msg)

  send_message: (message) ->
    @perform 'send_message', message: message, room: $('#room_id').val()

$('#new_message_body').on 'keypress', (e) ->
  if e.keyCode == 13
    message_body = $('#new_message_body')
    App.room.send_message message_body.val()
    message_body.val('')

$('#new_message_btn').on 'click', (e) ->
  message_body = $('#new_message_body')
  App.room.send_message message_body.val()
  message_body.val('')
