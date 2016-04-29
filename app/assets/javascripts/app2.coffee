ready  = ->
  $('#likeBtn').on 'click',  (e) ->
    e.preventDefault()
    $this = $(this)
    $.post
      url: $(this).data('url')
      dataType: "json"
      success: (data) ->
        $compteur = parseInt( $this.find('span').html() )
        if JSON.parse(data) == true
          $compteur++
        else
          $compteur--
        $this.find('span').html( $compteur )
    return
  return


$(document).ready ready
$(document).on 'page:load', ready
