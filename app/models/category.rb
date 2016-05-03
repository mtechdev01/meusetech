class Category < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders] # you can now do MyClass.find('bar')
  mount_uploader :icon, ThumbUploader

  has_many :articles, class_name: "BlogArticle",
                          foreign_key: "category_id"
  has_many :projects

end
