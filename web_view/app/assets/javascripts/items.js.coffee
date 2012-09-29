$ ->
  $('#new-item textarea').on('keyup', (event) ->
    if event.which == 13
      val = $.trim($(this).val())
      return if val == ''
      $(this).val('')
      $('.items-list').append('<div class="outer-item"><div class="item"><span class="text">'+val+'</span><a href="#" class="check">did it</a></div><br style="clear: both"/></div>')
      $.post('/items', { item: val})
  )

  $('.item a.check').on('click', ->
    item = $(this).parents('.item')
    item.addClass('checked')
    val = $('.text', item).text()
    $(this).remove()
    item.parent().remove()
    $('.items-list').append(item.parent())
    $.post('/items/check', { item: val, _method: 'put' })
    false
  )
