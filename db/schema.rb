# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_04_18_113609) do
  create_table "affiliates", force: :cascade do |t|
    t.string "paytm_number"
    t.string "campaign_name"
    t.string "referral_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "app_banners", force: :cascade do |t|
    t.text "image_url"
    t.text "redirect_url"
    t.boolean "status", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "app_offers", force: :cascade do |t|
    t.string "offer_name"
    t.string "identifier"
    t.text "description"
    t.text "instructions"
    t.string "payout_amount"
    t.boolean "retention_offer", default: false
    t.string "retention_amount"
    t.string "retention_day"
    t.string "action_url"
    t.string "refer_amount"
    t.string "image_url"
    t.integer "daily_cap"
    t.boolean "status", default: false
    t.string "whatsapp_link"
    t.boolean "event_offer", default: false
    t.integer "priority", default: 1
    t.boolean "insta_offer", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "img_url"
    t.date "published_date"
    t.boolean "highlight", default: false
    t.string "category"
    t.string "permalink"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "campaign_infos", force: :cascade do |t|
    t.string "redirect_url"
    t.string "title"
    t.float "amount"
    t.text "offer_steps"
    t.text "terms_n_condition"
    t.boolean "status"
    t.string "identifier"
    t.string "source"
    t.string "publisher"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "campaigns", force: :cascade do |t|
    t.string "click_id"
    t.string "source_ip"
    t.string "phone"
    t.string "version_code"
    t.string "version_name"
    t.string "source"
    t.string "mobile"
    t.string "amount"
    t.boolean "status", default: false
    t.integer "campaign_info_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "app_offer_id"
    t.string "event_title"
    t.string "event_amount"
    t.string "pay_type"
    t.integer "event_order", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "game_awards", force: :cascade do |t|
    t.string "title"
    t.string "image_url"
    t.text "rules"
    t.boolean "status", default: false
    t.string "identifier"
    t.string "redirect_url"
    t.string "input_name"
    t.string "publisher"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "game_rewards", force: :cascade do |t|
    t.string "player_id"
    t.integer "game_award_id"
    t.boolean "status", default: false
    t.string "click_id"
    t.string "source_ip"
    t.string "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "referrers", force: :cascade do |t|
    t.integer "affiliate_id"
    t.string "paytm_number"
    t.string "source_ip"
    t.string "click_id"
    t.integer "live_offer_id"
    t.integer "app_offer_id"
    t.boolean "aff_status", default: false
    t.boolean "ref_status", default: false
    t.string "aff_order_id"
    t.text "aff_pay_response"
    t.text "ref_pay_response"
    t.string "upi_id"
    t.string "telegram_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ref_order_id"
  end

end
