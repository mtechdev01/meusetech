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
    category_id: 1,
    title: "Article numero 1",
    content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    nb_fb_shared: 0,
    likes_count: 0,
    published: true,
    published_at: "2016-06-11 11:40:07.431666",
    thumb: "http://www.azurelite.net/photo/gal/pic/gal-2412236.jpg"
  },
  {
    user_id: 1,
    category_id: 2,
    title: "Article numero 2",
    content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    nb_fb_shared: 0,
    likes_count: 0,
    published: true,
    published_at: "2016-06-11 11:40:07.431666",
    thumb: "http://www.azurelite.net/photo/gal/pic/gal-2412236.jpg"
  },
  {
    user_id: 1,
    category_id: 3,
    title: "Article numero 3",
    content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    nb_fb_shared: 0,
    likes_count: 0,
    published: true,
    published_at: "2016-06-11 11:40:07.431666",
    thumb: "http://www.azurelite.net/photo/gal/pic/gal-2412236.jpg"
  },
  {
    user_id: 1,
    category_id: 9,
    title: "Article numero 4",
    content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    nb_fb_shared: 0,
    likes_count: 0,
    published: false,
    thumb: "http://www.azurelite.net/photo/gal/pic/gal-2412236.jpg"
  }
])
Category.create([
  {
    name: "Agriculture",
    icon: "https://image.freepik.com/icones-gratuites/tracteur_318-102062.png",
    color: "#FACC2E"
  },
  {
    name: "Développement durable",
    icon: "https://image.freepik.com/icones-gratuites/planter-un-arbre_318-41630.png",
    color: "#0EA723"
  },
  {
    name: "Economie",
    icon: "https://image.freepik.com/icones-gratuites/tirelire_318-37219.png",
    color: "#0AA0EB"
  },
  {
    name: "Emploi/Formation",
    icon: "https://image.freepik.com/icones-gratuites/homme-en-bureau-avec-ordinateur_318-29805.png",
    color: "#FE0404"
  },
  {
    name: "Habitat",
    icon: "https://image.freepik.com/icones-gratuites/la-maison-avant_318-49828.png",
    color: "#68A49E"
  },
  {
    name: "Service à la personne",
    icon: "https://image.freepik.com/icones-gratuites/aider-les-personnes-agees_318-80096.png",
    color: "#F43095"
  },
  {
    name: "Tourisme/Culture",
    icon: "https://image.freepik.com/icones-gratuites/comiques-et-dramatiques-masques_318-61635.png",
    color: "#FF6200"
  },
  {
    name: "Numérique",
    icon: "https://image.freepik.com/icones-gratuites/reseau-informatique-sur-la-bande_318-39449.png",
    color: "#0400FF"
  },
  {
    name: "Santé",
    icon: "https://image.freepik.com/icones-gratuites/battements-cardiaques_318-71082.png",
    color: "#FA58F4"
  },
  {
    name: "Autre",
    icon: "https://image.freepik.com/icones-gratuites/chef-d&-39;un-groupe-avec-une-bulle-vide_318-44062.png",
    color: "#8904B1"
  }
])

Project.create([
  {
    user_id: 1,
    category_id: 1,
    name: "Projet numero 1",
    content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    nb_fb_shared: 0,
    likes_count: 0
  },
  {
    user_id: 1,
    category_id: 2,
    name: "Projet numero 2",
    content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    nb_fb_shared: 0,
    likes_count: 0
  },
  {
    user_id: 1,
    category_id: 2,
    name: "Projet numero 3",
    content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    nb_fb_shared: 0,
    likes_count: 0
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
      avatar: "admin.png",
      address: "2, rue du developpement",
      city: "rubyCity",
      cp: 99150,
      is_admin: true,
      is_banned: false,
      can_comment: true,
  )
user.save!
