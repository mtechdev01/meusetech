$ ->
  $('#usersCommentsTable').DataTable
    "paging": true,
    "searching": true,
    "ordering": true
    'language':
      'lengthMenu': 'Afficher _MENU_ commentaires par page'
      'zeroRecords': 'aucun commentaire trouvé'
      'info': 'Page _PAGE_ à _PAGES_'
      'infoEmpty': 'aucun enregistrement'
      'search': 'Rechercher:'
