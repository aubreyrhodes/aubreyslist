add_item = (val) ->
  $('.items-list').prepend('<div class="outer-item"><div class="item"><span class="text">'+val+'</span><a href="#" class="check">did it</a></div><br style="clear: both"/></div>')

check_item = (val) ->
  item = $('.item span.text:contains("' + val + '"):first').parent()
  item.addClass('checked')
  $('.check', item).remove()
  item.parent().remove()
  $('.items-list').append(item.parent())



$ ->
  $('input, textarea').placeholder()
  $('#new-item textarea').on('keyup', (event) ->
    if event.which == 13
      val = $.trim($(this).val())
      return if val == ''
      $(this).val('')
      $.post('/items', { item: val})
  )

  $('.items-list').on('click', '.check', ->
    item = $(this).parents('.item')
    val = $('.text', item).text()
    $.post('/items/check', { item: val, _method: 'put' })
    false
  )

  pusher_id = $('body').data('pusher-id')
  channel_name = $('body').data('channel')

  pusher = new Pusher(pusher_id)
  channel = pusher.subscribe(channel_name)

  channel.bind('new', (data) ->
    add_item(data.item)
  )

  channel.bind('check', (data) ->
    check_item(data.item)
  )
