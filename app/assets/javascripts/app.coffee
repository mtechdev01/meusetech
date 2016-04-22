$(document).ready ->
  $('.notifs-menu').on 'mouseenter', '.notifs-unreaded', (e) ->
    $(this).removeClass('notifs-unreaded')
    e.stopPropagation()
    $this = $(this)
    $.post
      url: $(this).data('url')
      dataType: "json"
      success: (data) ->
        if data.success == true
          notifCount = $('.notifCount').html()
          result = notifCount - 1
          $('.notifCount').html(result)
          $this.find("span").remove()
          if result == 0
            $('.notifCount').remove()
    return
  return
