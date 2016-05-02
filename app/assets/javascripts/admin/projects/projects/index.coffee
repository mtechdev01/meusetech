$ ->
  $('#projectsTable').DataTable
    "paging": true,
    "searching": true,
    "ordering": true
    'language':
      'lengthMenu': 'Afficher _MENU_ projets par page'
      'zeroRecords': 'aucun projet trouvé'
      'info': 'Page _PAGE_ à _PAGES_'
      'infoEmpty': 'aucun enregistrement'
      'search': 'Rechercher:'
