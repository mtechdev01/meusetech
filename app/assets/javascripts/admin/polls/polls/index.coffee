ready = ->
  $ ->
    $('#pollsListe').DataTable
      "paging": true,
      "searching": true,
      "ordering": true


$(document).ready ready
$(document).on 'page:load', ready
