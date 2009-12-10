# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091130183022) do

  create_table "affiliations", :force => true do |t|
    t.integer  "tip_id"
    t.integer  "pitch_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "affiliations", ["pitch_id"], :name => "index_affiliations_on_pitch_id"
  add_index "affiliations", ["tip_id"], :name => "index_affiliations_on_tip_id"

  create_table "assignment_contributors", :force => true do |t|
    t.integer  "assignment_id"
    t.integer  "contributor_id"
    t.string   "status",         :default => "pending"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assignments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "pitch_id"
    t.string   "title"
    t.text     "body"
    t.text     "media_embed"
    t.string   "status",      :default => "open"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assignments", ["pitch_id"], :name => "index_assignments_on_pitch_id"
  add_index "assignments", ["user_id"], :name => "index_assignments_on_user_id"

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "network_id"
  end

  create_table "comments", :force => true do |t|
    t.string   "title"
    t.string   "commentable_type"
    t.integer  "commentable_id"
    t.integer  "user_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contributor_applications", :force => true do |t|
    t.integer  "user_id"
    t.integer  "pitch_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "approved",   :default => false
  end

  create_table "credentials", :force => true do |t|
    t.string   "title"
    t.string   "url"
    t.string   "type"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "credentials", ["user_id"], :name => "index_credentials_on_user_id"

  create_table "credits", :force => true do |t|
    t.integer  "user_id"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "amount",      :precision => 15, :scale => 2
  end

  create_table "donations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "pitch_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "purchase_id"
    t.string   "status",                                       :default => "unpaid"
    t.decimal  "amount",        :precision => 15, :scale => 2
    t.integer  "group_id"
    t.string   "donation_type",                                :default => "payment"
    t.integer  "credit_id"
  end

  add_index "donations", ["pitch_id"], :name => "index_donations_on_pitch_id"
  add_index "donations", ["purchase_id"], :name => "index_donations_on_purchase_id"
  add_index "donations", ["user_id"], :name => "index_donations_on_user_id"

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "networks", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "display_name"
  end

  create_table "news_items", :force => true do |t|
    t.string   "headline"
    t.string   "state"
    t.text     "short_description"
    t.text     "delivery_description"
    t.text     "extended_description"
    t.text     "skills"
    t.string   "keywords"
    t.boolean  "deliver_text",                                               :default => false, :null => false
    t.boolean  "deliver_audio",                                              :default => false, :null => false
    t.boolean  "deliver_video",                                              :default => false, :null => false
    t.boolean  "deliver_photo",                                              :default => false, :null => false
    t.boolean  "contract_agreement",                                         :default => false, :null => false
    t.datetime "expiration_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "featured_image_file_name"
    t.string   "featured_image_content_type"
    t.integer  "featured_image_file_size"
    t.datetime "featured_image_updated_at"
    t.string   "type"
    t.text     "video_embed"
    t.string   "featured_image_caption"
    t.integer  "user_id"
    t.string   "status"
    t.boolean  "feature"
    t.integer  "fact_checker_id"
    t.integer  "news_item_id"
    t.datetime "deleted_at"
    t.text     "widget_embed"
    t.decimal  "requested_amount",            :precision => 15, :scale => 2
    t.decimal  "current_funding",             :precision => 15, :scale => 2, :default => 0.0
    t.integer  "network_id"
    t.integer  "category_id"
    t.text     "external_links"
    t.text     "license"
  end

  add_index "news_items", ["expiration_date"], :name => "index_pitches_on_expiration_date"
  add_index "news_items", ["state"], :name => "index_pitches_on_state"
  add_index "news_items", ["type"], :name => "index_news_items_on_type"
  add_index "news_items", ["user_id"], :name => "index_news_items_on_user_id"

  create_table "organization_pitches", :force => true do |t|
    t.integer  "organization_id"
    t.integer  "pitch_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "paypal_transactions", :force => true do |t|
    t.string   "txn_id"
    t.integer  "purchase_id"
    t.string   "status"
    t.text     "paypal_response"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pledges", :force => true do |t|
    t.integer  "user_id"
    t.integer  "tip_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.decimal  "amount",     :precision => 15, :scale => 2
  end

  add_index "pledges", ["tip_id"], :name => "index_pledges_on_tip_id"
  add_index "pledges", ["user_id"], :name => "index_pledges_on_user_id"

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.text     "media_embed"
    t.integer  "pitch_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "purchases", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "credit_card_number_ending"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "total_amount",              :precision => 15, :scale => 2
    t.string   "paypal_transaction_id"
  end

  add_index "purchases", ["user_id"], :name => "index_purchases_on_user_id"

  create_table "site_options", :force => true do |t|
    t.string   "key"
    t.text     "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spotus_donations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "purchase_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "amount",      :precision => 15, :scale => 2
  end

  create_table "subscribers", :force => true do |t|
    t.integer  "pitch_id"
    t.string   "email"
    t.string   "status",       :default => "requested"
    t.string   "invite_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subscribers", ["pitch_id"], :name => "index_subscribers_on_pitch_id"

  create_table "topic_memberships", :force => true do |t|
    t.integer  "member_id"
    t.string   "member_type"
    t.integer  "topic_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "topic_memberships", ["member_id"], :name => "index_topic_memberships_on_member_id"
  add_index "topic_memberships", ["topic_id"], :name => "index_topic_memberships_on_topic_id"

  create_table "topics", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "type"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.text     "about_you"
    t.string   "website"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.string   "country"
    t.boolean  "notify_blog_posts",                       :default => false, :null => false
    t.boolean  "notify_comments",                         :default => false
    t.boolean  "notify_tips",                             :default => false, :null => false
    t.boolean  "notify_pitches",                          :default => false, :null => false
    t.boolean  "notify_stories",                          :default => false, :null => false
    t.boolean  "notify_spotus_news",                      :default => false, :null => false
    t.boolean  "fact_check_interest",                     :default => false, :null => false
    t.string   "status"
    t.string   "organization_name"
    t.string   "established_year"
    t.datetime "deleted_at"
    t.string   "activation_code"
    t.integer  "network_id"
    t.integer  "category_id"
    t.integer  "fb_user_id",                :limit => 8
    t.string   "email_hash"
  end

end
