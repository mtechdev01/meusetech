ready = ->
  $ ->
    $('#pollsListe').DataTable
      "paging": true,
      "searching": true,
      "ordering": true
      'language':
        'lengthMenu': 'Afficher _MENU_ sondages par page'
        'zeroRecords': 'aucun sondage trouvé'
        'info': 'Page _PAGE_ à _PAGES_'
        'infoEmpty': 'aucun enregistrement'
        'search': 'Rechercher:'

$(document).ready ready
$(document).on 'page:load', ready
