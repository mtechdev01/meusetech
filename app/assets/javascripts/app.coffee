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
          $this.find('.new-notif').fadeOut()
          if result == 0
            return $('.notifCount').fadeOut()
        return
    return
  return
  $('.treeview').on 'click', (e) ->
    $('treeview-menu-open').removeClass('menu-open').attr 'display', 'none'
    ul = undefined
    ul = $(this).find('ul')
    ul.addClass('treeview-menu-open').addClass('menu-open').attr 'display', 'block'
  return


closeAlert = ->
  setTimeout (->
    $('.alert').fadeOut()
    return
  ), 3000

$(document).ready ready
$(document).on 'page:load', ready
$(document).ready closeAlert
$(document).on 'page:load', closeAlert
