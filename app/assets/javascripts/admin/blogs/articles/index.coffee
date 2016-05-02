$ ->
  $('#articlesListe').DataTable
    "paging": true,
    "searching": true,
    "ordering": true
    'language':
      'lengthMenu': 'Afficher _MENU_ articles par page'
      'zeroRecords': 'aucun article trouvé'
      'info': 'Page _PAGE_ à _PAGES_'
      'infoEmpty': 'aucun enregistrement'
      'search': 'Rechercher:'
