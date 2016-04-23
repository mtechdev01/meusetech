ready = ->
  $('.notifs-menu').on 'mouseenter', '.notifs-unreaded', (e) ->
    $this = undefined
    $(this).removeClass 'notifs-unreaded'
    e.stopPropagation()
    $this = $(this)
    $.post
      url: $(this).data('url')
      dataType: 'json'
      success: (data) ->
        notifCount = undefined
        result = undefined
        if data.success == true
          notifCount = $('.notifCount').html()
          result = notifCount - 1
          $('.notifCount').html result
          $this.find('span').fadeOut()
          if result == 0
            return $('.notifCount').fadeOut()
        return
    return
  return

$(document).ready ready
$(document).on 'page:load', ready