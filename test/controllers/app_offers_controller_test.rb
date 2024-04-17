require "test_helper"

class AppOffersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @app_offer = app_offers(:one)
  end

  test "should get index" do
    get app_offers_url
    assert_response :success
  end

  test "should get new" do
    get new_app_offer_url
    assert_response :success
  end

  test "should create app_offer" do
    assert_difference("AppOffer.count") do
      post app_offers_url, params: { app_offer: { action_url: @app_offer.action_url, daily_cap: @app_offer.daily_cap, description: @app_offer.description, event_offer: @app_offer.event_offer, identifier: @app_offer.identifier, image_url: @app_offer.image_url, insta_offer: @app_offer.insta_offer, instructions: @app_offer.instructions, offer_name: @app_offer.offer_name, payout_amount: @app_offer.payout_amount, priority: @app_offer.priority, refer_amount: @app_offer.refer_amount, retention_amount: @app_offer.retention_amount, retention_day: @app_offer.retention_day, retention_offer: @app_offer.retention_offer, status: @app_offer.status, whatsapp_link: @app_offer.whatsapp_link } }
    end

    assert_redirected_to app_offer_url(AppOffer.last)
  end

  test "should show app_offer" do
    get app_offer_url(@app_offer)
    assert_response :success
  end

  test "should get edit" do
    get edit_app_offer_url(@app_offer)
    assert_response :success
  end

  test "should update app_offer" do
    patch app_offer_url(@app_offer), params: { app_offer: { action_url: @app_offer.action_url, daily_cap: @app_offer.daily_cap, description: @app_offer.description, event_offer: @app_offer.event_offer, identifier: @app_offer.identifier, image_url: @app_offer.image_url, insta_offer: @app_offer.insta_offer, instructions: @app_offer.instructions, offer_name: @app_offer.offer_name, payout_amount: @app_offer.payout_amount, priority: @app_offer.priority, refer_amount: @app_offer.refer_amount, retention_amount: @app_offer.retention_amount, retention_day: @app_offer.retention_day, retention_offer: @app_offer.retention_offer, status: @app_offer.status, whatsapp_link: @app_offer.whatsapp_link } }
    assert_redirected_to app_offer_url(@app_offer)
  end

  test "should destroy app_offer" do
    assert_difference("AppOffer.count", -1) do
      delete app_offer_url(@app_offer)
    end

    assert_redirected_to app_offers_url
  end
end
