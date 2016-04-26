$(document).ready ->
  $('#likeBtn').on 'click',  (e) ->
    e.preventDefault()
    $this = $(this)
    $.post
      url: $(this).data('url')
      dataType: "json"
      success: (data) ->
          console.log data
    return
  return
