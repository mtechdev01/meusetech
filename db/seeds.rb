# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


BlogArticle.create([
  {
    user_id: 1,
    blog_category_id: 1,
    title: "Article numero 1",
    content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    nb_fb_shared: 0,
    nb_likes: 0,
    thumb: "http://www.azurelite.net/photo/gal/pic/gal-2412236.jpg"
  },
  {
    user_id: 1,
    blog_category_id: 2,
    title: "Article numero 2",
    content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    nb_fb_shared: 0,
    nb_likes: 0,
    thumb: "http://www.azurelite.net/photo/gal/pic/gal-2412236.jpg"
  },
  {
    user_id: 1,
    blog_category_id: 1,
    title: "Article numero 3",
    content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    nb_fb_shared: 0,
    nb_likes: 0,
    thumb: "http://www.azurelite.net/photo/gal/pic/gal-2412236.jpg"
  },
  {
    user_id: 1,
    blog_category_id: 2,
    title: "Article numero 4",
    content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    nb_fb_shared: 0,
    nb_likes: 0,
    thumb: "http://www.azurelite.net/photo/gal/pic/gal-2412236.jpg"
  }
])
BlogCategory.create([
  {
    name: "Agriculture",
    icon: "https://image.freepik.com/icones-gratuites/tracteur_318-102062.png",
    color: "#3498db"
  },
  {
    name: "Enfants",
    icon: "https://image.freepik.com/icones-gratuites/les-enfants-sur-balancoire-a-bascule_318-78143.png",
    color: "#e74c3c"
  }
])

Project.create([
  {
    user_id: 1,
    projects_category_id: 1,
    name: "Projet numero 1",
    content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    nb_fb_shared: 0,
    nb_likes: 0
  },
  {
    user_id: 1,
    projects_category_id: 1,
    name: "Projet numero 2",
    content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    nb_fb_shared: 0,
    nb_likes: 0
  },
  {
    user_id: 1,
    projects_category_id: 2,
    name: "Projet numero 3",
    content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    nb_fb_shared: 0,
    nb_likes: 0
  }
])

ProjectsCategory.create([
  {
    name: "Agriculture",
    description: "J'aime les tracteurs",
    icon: "https://image.freepik.com/icones-gratuites/tracteur_318-102062.png",
    color: "#9b59b6"
  },
  {
    name: "Enfants",
    description: "Activités pour enfants",
    icon: "https://image.freepik.com/icones-gratuites/les-enfants-sur-balancoire-a-bascule_318-78143.png",
    color: "#16a085"
  }
])

Poll.create([
  {
    title: "Sondage 1",
    description: "Voici mon premier sondage",
    start_at: "2016-04-09 11:40:07.431666",
    end_at: "2016-06-11 11:40:07.431666"
  }
])

PollsField.create([
  {
    poll_id: 1,
    input_type: "text",
    is_required: true,
    name: "tv",
    options: nil,
    rules: nil,
    label: "Quel est la marque de votre téléviseur ?"
  },
  {
    poll_id: 1,
    input_type: "number",
    is_required: true,
    name: "heure",
    options: nil,
    rules: nil,
    label: "Combien d'heure regardez vous la télévision par jour ?"
  },
  {
    poll_id: 1,
    input_type: "select",
    is_required: true,
    name: "chaines",
    options: "tf1, france2, France3, M6",
    rules: nil,
    label: "Quelle chaine regardez vous le plus ?"
  }
])


user = User.new(
      :email                 => "admin@local.io",
      :password              => "11111122",
      :password_confirmation => "11111122",
      username: "Admin",
      firstname: "AdminFirst",
      lastname: "AdminLast",
      avatar: "/assets/avatars/admin.png",
      address: "2, rue du developpement",
      city: "rubyCity",
      cp: 99150,
      is_admin: true,
      is_banned: false,
      can_comment: true,
  )
user.save!
