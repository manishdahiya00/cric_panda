require "application_system_test_case"

class ReferrersTest < ApplicationSystemTestCase
  setup do
    @referrer = referrers(:one)
  end

  test "visiting the index" do
    visit referrers_url
    assert_selector "h1", text: "Referrers"
  end

  test "should create referrer" do
    visit referrers_url
    click_on "New referrer"

    fill_in "Aff order", with: @referrer.aff_order_id
    fill_in "Aff pay response", with: @referrer.aff_pay_response
    check "Aff status" if @referrer.aff_status
    fill_in "Affiliate", with: @referrer.affiliate_id
    fill_in "App offer", with: @referrer.app_offer_id
    fill_in "Click", with: @referrer.click_id
    fill_in "Live offer", with: @referrer.live_offer_id
    fill_in "Paytm number", with: @referrer.paytm_number
    fill_in "Ref pay response", with: @referrer.ref_pay_response
    check "Ref status" if @referrer.ref_status
    fill_in "Source ip", with: @referrer.source_ip
    fill_in "Telegram", with: @referrer.telegram_id
    fill_in "Upi", with: @referrer.upi_id
    click_on "Create Referrer"

    assert_text "Referrer was successfully created"
    click_on "Back"
  end

  test "should update Referrer" do
    visit referrer_url(@referrer)
    click_on "Edit this referrer", match: :first

    fill_in "Aff order", with: @referrer.aff_order_id
    fill_in "Aff pay response", with: @referrer.aff_pay_response
    check "Aff status" if @referrer.aff_status
    fill_in "Affiliate", with: @referrer.affiliate_id
    fill_in "App offer", with: @referrer.app_offer_id
    fill_in "Click", with: @referrer.click_id
    fill_in "Live offer", with: @referrer.live_offer_id
    fill_in "Paytm number", with: @referrer.paytm_number
    fill_in "Ref pay response", with: @referrer.ref_pay_response
    check "Ref status" if @referrer.ref_status
    fill_in "Source ip", with: @referrer.source_ip
    fill_in "Telegram", with: @referrer.telegram_id
    fill_in "Upi", with: @referrer.upi_id
    click_on "Update Referrer"

    assert_text "Referrer was successfully updated"
    click_on "Back"
  end

  test "should destroy Referrer" do
    visit referrer_url(@referrer)
    click_on "Destroy this referrer", match: :first

    assert_text "Referrer was successfully destroyed"
  end
end
