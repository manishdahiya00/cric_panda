require "application_system_test_case"

class AppOffersTest < ApplicationSystemTestCase
  setup do
    @app_offer = app_offers(:one)
  end

  test "visiting the index" do
    visit app_offers_url
    assert_selector "h1", text: "App offers"
  end

  test "should create app offer" do
    visit app_offers_url
    click_on "New app offer"

    fill_in "Action url", with: @app_offer.action_url
    fill_in "Daily cap", with: @app_offer.daily_cap
    fill_in "Description", with: @app_offer.description
    check "Event offer" if @app_offer.event_offer
    fill_in "Identifier", with: @app_offer.identifier
    fill_in "Image url", with: @app_offer.image_url
    check "Insta offer" if @app_offer.insta_offer
    fill_in "Instructions", with: @app_offer.instructions
    fill_in "Offer name", with: @app_offer.offer_name
    fill_in "Payout amount", with: @app_offer.payout_amount
    fill_in "Priority", with: @app_offer.priority
    fill_in "Refer amount", with: @app_offer.refer_amount
    fill_in "Retention amount", with: @app_offer.retention_amount
    fill_in "Retention day", with: @app_offer.retention_day
    check "Retention offer" if @app_offer.retention_offer
    check "Status" if @app_offer.status
    fill_in "Whatsapp link", with: @app_offer.whatsapp_link
    click_on "Create App offer"

    assert_text "App offer was successfully created"
    click_on "Back"
  end

  test "should update App offer" do
    visit app_offer_url(@app_offer)
    click_on "Edit this app offer", match: :first

    fill_in "Action url", with: @app_offer.action_url
    fill_in "Daily cap", with: @app_offer.daily_cap
    fill_in "Description", with: @app_offer.description
    check "Event offer" if @app_offer.event_offer
    fill_in "Identifier", with: @app_offer.identifier
    fill_in "Image url", with: @app_offer.image_url
    check "Insta offer" if @app_offer.insta_offer
    fill_in "Instructions", with: @app_offer.instructions
    fill_in "Offer name", with: @app_offer.offer_name
    fill_in "Payout amount", with: @app_offer.payout_amount
    fill_in "Priority", with: @app_offer.priority
    fill_in "Refer amount", with: @app_offer.refer_amount
    fill_in "Retention amount", with: @app_offer.retention_amount
    fill_in "Retention day", with: @app_offer.retention_day
    check "Retention offer" if @app_offer.retention_offer
    check "Status" if @app_offer.status
    fill_in "Whatsapp link", with: @app_offer.whatsapp_link
    click_on "Update App offer"

    assert_text "App offer was successfully updated"
    click_on "Back"
  end

  test "should destroy App offer" do
    visit app_offer_url(@app_offer)
    click_on "Destroy this app offer", match: :first

    assert_text "App offer was successfully destroyed"
  end
end
