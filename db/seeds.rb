# Création de valeurs par default pour developpement

puts "CREATION DES UTILISATEURS"
admin = User.new(
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
admin.save!

jc = User.new(
  :email                 => "jc@local.io",
  :password              => "11111122",
  :password_confirmation => "11111122",
  username: "jean-christophe",
  firstname: "jean-christophe",
  lastname: "Pires",
  avatar: "admin.png",
  address: "2, rue du developpement",
  city: "rubyCity",
  cp: 99150,
  is_admin: false,
  is_banned: false,
  can_comment: true,
)
jc.save!

cecile = User.new(
  :email                 => "cecile@local.io",
  :password              => "11111122",
  :password_confirmation => "11111122",
  username: "cecile",
  firstname: "cécile",
  lastname: "LaTouteBelle",
  avatar: "admin.png",
  address: "2, rue du developpement",
  city: "rubyCity",
  cp: 99150,
  is_admin: false,
  is_banned: false,
  can_comment: true,
)
cecile.save!

john = User.new(
  :email                 => "john@local.io",
  :password              => "11111122",
  :password_confirmation => "11111122",
  username: "john",
  firstname: "john",
  lastname: "JohnGiver",
  avatar: "admin.png",
  address: "2, rue du developpement",
  city: "rubyCity",
  cp: 99150,
  is_admin: false,
  is_banned: false,
  can_comment: true,
)
john.save!

jerome = User.new(
  :email                 => "jerome@local.io",
  :password              => "11111122",
  :password_confirmation => "11111122",
  username: "jerome",
  firstname: "jerome",
  lastname: "bouffeDlaDoc",
  avatar: "admin.png",
  address: "2, rue du developpement",
  city: "rubyCity",
  cp: 99150,
  is_admin: false,
  is_banned: false,
  can_comment: true,
)
jerome.save!

benjamin = User.new(
  :email                 => "benjamin@local.io",
  :password              => "11111122",
  :password_confirmation => "11111122",
  username: "benjamin",
  firstname: "benjamin",
  lastname: "CraquageMan",
  avatar: "admin.png",
  address: "2, rue du developpement",
  city: "rubyCity",
  cp: 99150,
  is_admin: false,
  is_banned: false,
  can_comment: true,
)
benjamin.save!

puts "CREATION DES CATEGORIES"
cat1 = Category.new(
  name: "Agriculture",
  icon: "https://image.freepik.com/icones-gratuites/tracteur_318-102062.png",
  color: "#FACC2E"
)
cat1.save!

cat2 = Category.new(
  name: "Développement durable",
  icon: "https://image.freepik.com/icones-gratuites/planter-un-arbre_318-41630.png",
  color: "#0EA723"
)
cat2.save!

cat3 = Category.new(
  name: "Economie",
  icon: "https://image.freepik.com/icones-gratuites/tirelire_318-37219.png",
  color: "#0AA0EB"
)
cat3.save!

cat4 = Category.new(
  name: "Emploi/Formation",
  icon: "https://image.freepik.com/icones-gratuites/homme-en-bureau-avec-ordinateur_318-29805.png",
  color: "#FE0404"
)
cat4.save!

cat5 = Category.new(
  name: "Habitat",
  icon: "https://image.freepik.com/icones-gratuites/la-maison-avant_318-49828.png",
  color: "#68A49E"
)
cat5.save!

cat6 = Category.new(
  name: "Service à la personne",
  icon: "https://image.freepik.com/icones-gratuites/aider-les-personnes-agees_318-80096.png",
  color: "#F43095"
)
cat6.save!

cat7 = Category.new(
  name: "Tourisme/Culture",
  icon: "https://image.freepik.com/icones-gratuites/comiques-et-dramatiques-masques_318-61635.png",
  color: "#FF6200"
)
cat7.save!

cat8 = Category.new(
  name: "Numérique",
  icon: "https://image.freepik.com/icones-gratuites/reseau-informatique-sur-la-bande_318-39449.png",
  color: "#0400FF"
)
cat8.save!

cat9 = Category.new(
  name: "Santé",
  icon: "https://image.freepik.com/icones-gratuites/battements-cardiaques_318-71082.png",
  color: "#FA58F4"
)
cat9.save!

cat10 = Category.new(
  name: "Autre",
  icon: "https://image.freepik.com/icones-gratuites/chef-d&-39;un-groupe-avec-une-bulle-vide_318-44062.png",
  color: "#8904B1"
)
cat10.save!

puts "CREATION DES ARTICLES"
article1 = BlogArticle.new(
  user: admin,
  category: cat1,
  title: "Article numero 1",
  content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  nb_fb_shared: 0,
  nb_likes: 0,
  published: true,
  published_at: "2016-06-11 11:40:07.431666",
  thumb: "http://www.azurelite.net/photo/gal/pic/gal-2412236.jpg"
)
article1.save!

article2 = BlogArticle.new(
  user: admin,
  category: cat1,
  title: "Article numero 2",
  content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  nb_fb_shared: 0,
  nb_likes: 0,
  published: true,
  published_at: "2016-06-11 11:40:07.431666",
  thumb: "http://www.azurelite.net/photo/gal/pic/gal-2412236.jpg"
)
article2.save!

article3 = BlogArticle.new(
  user: admin,
  category: cat1,
  title: "Article numero 3",
  content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  nb_fb_shared: 0,
  nb_likes: 0,
  published: true,
  published_at: "2016-06-11 11:40:07.431666",
  thumb: "http://www.azurelite.net/photo/gal/pic/gal-2412236.jpg"
)
article3.save!

article4 = BlogArticle.new(
  user: admin,
  category: cat2,
  title: "Article numero 4",
  content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  nb_fb_shared: 0,
  nb_likes: 0,
  published: false,
  thumb: "http://www.azurelite.net/photo/gal/pic/gal-2412236.jpg"
)
article4.save!

article5 = BlogArticle.new(
  user: admin,
  category: cat3,
  title: "Article numero 5",
  content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  nb_fb_shared: 0,
  nb_likes: 0,
  published: false,
  thumb: "http://www.azurelite.net/photo/gal/pic/gal-2412236.jpg"
)
article5.save!

article6 = BlogArticle.new(
  user: admin,
  category: cat4,
  title: "Article numero 6",
  content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  nb_fb_shared: 0,
  nb_likes: 0,
  published: false,
  thumb: "http://www.azurelite.net/photo/gal/pic/gal-2412236.jpg"
)
article6.save!

puts "CREATION DES PROJETS"
projet1 = Project.new(
  user: jc,
  category: cat1,
  name: "Projet numero 1 de jc",
  content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  nb_fb_shared: 0,
  nb_likes: 0
)
projet1.save!

projet2 = Project.new(
  user: cecile,
  category: cat2,
  name: "Projet numero 2 de cecile",
  content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  nb_fb_shared: 0,
  nb_likes: 0
)
projet2.save!

projet3 = Project.new(
  user: john,
  category: cat3,
  name: "Projet numero 3 de john",
  content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  nb_fb_shared: 0,
  nb_likes: 0
)
projet3.save!

projet4 = Project.new(
  user: jerome,
  category: cat4,
  name: "Projet numero 4 de jerome",
  content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  nb_fb_shared: 0,
  nb_likes: 0
)
projet4.save!

projet5 = Project.new(
  user: benjamin,
  category: cat5,
  name: "Projet numero 5 de benjamin",
  content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  nb_fb_shared: 0,
  nb_likes: 0
)
projet5.save!

puts "CREATION DES SONDAGES"
poll1 = Poll.new(
  title: "Sondage 1",
  description: "Voici mon premier sondage",
  start_at: "2016-04-09 11:40:07.431666",
  end_at: "2016-05-07 11:40:07.431666"
)
poll1.save!

poll2 = Poll.new(
  title: "Sondage numero 2",
  description: "Voici mon deuxieme sondage",
  start_at: "2016-04-10 11:40:07.431666",
  end_at: "2016-04-30 11:40:07.431666"
)
poll2.save!

puts "CREATION DES QUESTIONS DES SONDAGES"
fields1 = PollsField.new(
  poll: poll1,
  input_type: "text",
  is_required: true,
  name: "tv",
  options: nil,
  rules: nil,
  label: "Quel est la marque de votre téléviseur ?"
)
fields1.save!

fields2 = PollsField.new(
  poll: poll1,
  input_type: "number",
  is_required: true,
  name: "heure",
  options: nil,
  rules: "min=0, max=24",
  label: "Combien d'heure regardez vous la télévision par jour ?"
)
fields2.save!

fields3 = PollsField.new(
  poll: poll1,
  input_type: "select",
  is_required: true,
  name: "chaines",
  options: "tf1, france2, France3, M6",
  rules: nil,
  label: "Quelle chaine regardez vous le plus ?"
)
fields3.save!

puts "CREATION DES COMMENTAIRES"
com1 = Comment.new(
  blog_article: article1,
  project: nil,
  user: jc,
  content: "Je suis le premier commentaire c'est cool non?",
  nb_likes: 0,
  is_valid: false
)
com1.save!

com2 = Comment.new(
  blog_article: article1,
  project: nil,
  user: cecile,
  content: "Je suis le deuxieme commentaire",
  nb_likes: 0,
  is_valid: false
)
com2.save!

com3 = Comment.new(
  blog_article: article1,
  project: nil,
  user: john,
  content: "Je suis le quatrieme commentaire",
  nb_likes: 0,
  is_valid: false
)
com3.save!

com4 = Comment.new(
  blog_article: nil,
  project: projet1,
  user: jerome,
  content: "Je suis le quatrieme commentaire",
  nb_likes: 0,
  is_valid: false
)
com4.save!

com5 = Comment.new(
  blog_article: nil,
  project: projet1,
  user: benjamin,
  content: "Je suis le cinquieme commentaire",
  nb_likes: 0,
  is_valid: false
)
com5.save!

com6 = Comment.new(
  blog_article: nil,
  project: projet1,
  user: jerome,
  content: "Je suis le sixieme commentaire",
  nb_likes: 0,
  is_valid: false
)
com6.save!

puts "CREATION DES NOTIFICATIONS"
notif1 = Notification.new(
  sender: jc,
  receiver: admin,
  model:  'BlogArticle',
  key: article1.id,
  msg: 'Nouveau commentaire',
  readed: false
)
notif1.save!

notif2 = Notification.new(
  sender: cecile,
  receiver: admin,
  model: 'BlogArticle',
  key: article1.id,
  msg: 'Nouveau commentaire',
  readed: false
)
notif2.save!

notif3 = Notification.new(
  sender: john,
  receiver: admin,
  model: 'BlogArticle',
  key: article1.id,
  msg: 'Nouveau commentaire',
  readed: false
)
notif3.save!

notif4 = Notification.new(
  sender: jerome,
  receiver: jc,
  model: 'Project',
  key: projet1.id,
  msg: 'Nouveau commentaire',
  readed: false
)
notif4.save!

notif5 = Notification.new(
  sender: benjamin,
  receiver: jc,
  model: 'Project',
  key: projet1.id,
  msg: 'Nouveau commentaire',
  readed: false
)
notif5.save!

notif6 = Notification.new(
  sender: jerome,
  receiver: jc,
  model: 'Project',
  key: projet1.id,
  msg: 'Nouveau commentaire',
  readed: false
)
notif6.save!
