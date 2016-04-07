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
    content: "Je suis un article trop bien t'as vu",
    nb_fb_shared: 0,
    nb_likes: 0,
    thumb: "http://www.azurelite.net/photo/gal/pic/gal-2412236.jpg"
  },
  {
    user_id: 1,
    blog_category_id: 2,
    title: "Article numero 2",
    content: "Je suis un article trop bien t'as vu trololololo",
    nb_fb_shared: 0,
    nb_likes: 0,
    thumb: "http://www.azurelite.net/photo/gal/pic/gal-2412236.jpg"
  },
  {
    user_id: 1,
    blog_category_id: 1,
    title: "Article numero 3",
    content: "Je suis un article trop bien t'as vu yolo",
    nb_fb_shared: 0,
    nb_likes: 0,
    thumb: "http://www.azurelite.net/photo/gal/pic/gal-2412236.jpg"
  },
  {
    user_id: 1,
    blog_category_id: 2,
    title: "Article numero 4",
    content: "Je suis un article trop bien t'as vu yololo",
    nb_fb_shared: 0,
    nb_likes: 0,
    thumb: "http://www.azurelite.net/photo/gal/pic/gal-2412236.jpg"
    }
    ])


BlogCategory.create([
  {
    name: "Agriculture",
    icon: "https://image.freepik.com/icones-gratuites/tracteur_318-102062.png"
  },
  {
    name: "Enfants",
    icon: "https://image.freepik.com/icones-gratuites/les-enfants-sur-balancoire-a-bascule_318-78143.png"
  }
  ])

  Project.create([
    {
      user_id: 1,
      projects_category_id: 1,
      name: "Projet numero 1",
      content: "Mon super projet trololololo",
      nb_fb_shared: 0,
      nb_likes: 0
    },
    {
      user_id: 1,
      projects_category_id: 1,
      name: "Projet numero 2",
      content: "Mon super projet yololololool",
      nb_fb_shared: 0,
      nb_likes: 0
    },
    {
      user_id: 2,
      projects_category_id: 2,
      name: "Projet numero 3",
      content: "Mon super projet djdfdqhfhiuhgrq",
      nb_fb_shared: 0,
      nb_likes: 0
    }
    ])

    ProjectsCategory.create([
      {
        name: "Agriculture",
        description: "J'aime les tracteurs",
        icon: "https://image.freepik.com/icones-gratuites/tracteur_318-102062.png"
      },
      {
        name: "Enfants",
        description: "Activités pour enfants",
        icon: "https://image.freepik.com/icones-gratuites/les-enfants-sur-balancoire-a-bascule_318-78143.png"
      }
      ])

  #  Poll.create([
  #    {
  #      title: "Sondage 1",
  #      description: "Voici mon premier sondage"
  #    }
  #    ])
