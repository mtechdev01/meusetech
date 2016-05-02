# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160427124628) do

  create_table "blog_articles", force: :cascade do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "user_id"
    t.string   "title"
    t.text     "content"
    t.integer  "nb_fb_shared"
    t.integer  "likes_count"
    t.string   "thumb"
    t.integer  "comments_count", default: 0
    t.boolean  "published",      default: false
    t.datetime "published_at"
    t.integer  "category_id"
  end

  add_index "blog_articles", ["category_id"], name: "index_blog_articles_on_category_id"
  add_index "blog_articles", ["user_id"], name: "index_blog_articles_on_user_id"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.text   "description"
    t.string "icon"
    t.string "color"
  end

  create_table "comments", force: :cascade do |t|
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "blog_article_id"
    t.integer  "project_id"
    t.integer  "user_id"
    t.text     "content"
    t.integer  "likes_count"
    t.boolean  "is_valid",        default: false
  end

  add_index "comments", ["blog_article_id"], name: "index_comments_on_blog_article_id"
  add_index "comments", ["project_id"], name: "index_comments_on_project_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "likes", force: :cascade do |t|
    t.integer "blog_article_id"
    t.integer "project_id"
    t.integer "user_id"
  end

  add_index "likes", ["blog_article_id"], name: "index_likes_on_blog_article_id"
  add_index "likes", ["project_id"], name: "index_likes_on_project_id"
  add_index "likes", ["user_id"], name: "index_likes_on_user_id"

  create_table "newsletters", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.datetime "sended_at"
    t.boolean  "sended"
    t.text     "content"
    t.string   "title"
  end

  add_index "newsletters", ["user_id"], name: "index_newsletters_on_user_id"

  create_table "newsletters_users", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "user_id"
    t.integer  "newsletter_id"
  end

  add_index "newsletters_users", ["newsletter_id"], name: "index_newsletters_users_on_newsletter_id"
  add_index "newsletters_users", ["user_id"], name: "index_newsletters_users_on_user_id"

  create_table "notifications", force: :cascade do |t|
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "model"
    t.integer  "key"
    t.integer  "sender"
    t.integer  "receiver"
    t.string   "msg"
    t.boolean  "readed",     default: false
  end

  create_table "polls", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "title"
    t.text     "description"
    t.integer  "nb_responses"
    t.datetime "start_at"
    t.datetime "end_at"
  end

  create_table "polls_fields", force: :cascade do |t|
    t.integer "poll_id"
    t.string  "input_type"
    t.boolean "is_required"
    t.string  "name"
    t.string  "options"
    t.string  "rules"
    t.string  "label"
  end

  add_index "polls_fields", ["poll_id"], name: "index_polls_fields_on_poll_id"

  create_table "polls_fields_responses", force: :cascade do |t|
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "poll_id"
    t.integer  "polls_field_id"
    t.integer  "user_id"
    t.string   "response"
  end

  add_index "polls_fields_responses", ["poll_id"], name: "index_polls_fields_responses_on_poll_id"
  add_index "polls_fields_responses", ["polls_field_id"], name: "index_polls_fields_responses_on_polls_field_id"
  add_index "polls_fields_responses", ["user_id"], name: "index_polls_fields_responses_on_user_id"

  create_table "projects", force: :cascade do |t|
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "user_id"
    t.string   "name",           default: "",        null: false
    t.text     "content",        default: "",        null: false
    t.integer  "nb_fb_shared"
    t.string   "state",          default: "Proposé"
    t.integer  "likes_count",    default: 0
    t.integer  "comments_count", default: 0
    t.integer  "thumb"
    t.integer  "category_id"
    t.string   "location",       default: "verdun"
  end

  add_index "projects", ["category_id"], name: "index_projects_on_category_id"
  add_index "projects", ["user_id"], name: "index_projects_on_user_id"

  create_table "projects_followers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "project_id"
  end

  add_index "projects_followers", ["project_id"], name: "index_projects_followers_on_project_id"
  add_index "projects_followers", ["user_id"], name: "index_projects_followers_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "address"
    t.string   "city"
    t.integer  "cp"
    t.boolean  "is_admin",               default: false
    t.boolean  "is_banned",              default: false
    t.boolean  "can_comment",            default: false
    t.string   "avatar"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
