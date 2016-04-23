$ ->
  $('#usersTable').DataTable
    "paging": true,
    "searching": true,
    "ordering": true
    'language':
      'lengthMenu': 'Montrer _MENU_ membres par page'
      'zeroRecords': 'aucun utilisateur trouvé'
      'info': 'Page _PAGE_ à _PAGES_'
      'infoEmpty': 'aucun enregistrement'
      'search': 'Rechercher:'
      dom: 'Bfrtip'
      buttons: [
        'csv'
      ]
