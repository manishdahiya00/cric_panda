require "application_system_test_case"

class AffiliatesTest < ApplicationSystemTestCase
  setup do
    @affiliate = affiliates(:one)
  end

  test "visiting the index" do
    visit affiliates_url
    assert_selector "h1", text: "Affiliates"
  end

  test "should create affiliate" do
    visit affiliates_url
    click_on "New affiliate"

    fill_in "Campaign name", with: @affiliate.campaign_name
    fill_in "Paytm number", with: @affiliate.paytm_number
    fill_in "Referral code", with: @affiliate.referral_code
    click_on "Create Affiliate"

    assert_text "Affiliate was successfully created"
    click_on "Back"
  end

  test "should update Affiliate" do
    visit affiliate_url(@affiliate)
    click_on "Edit this affiliate", match: :first

    fill_in "Campaign name", with: @affiliate.campaign_name
    fill_in "Paytm number", with: @affiliate.paytm_number
    fill_in "Referral code", with: @affiliate.referral_code
    click_on "Update Affiliate"

    assert_text "Affiliate was successfully updated"
    click_on "Back"
  end

  test "should destroy Affiliate" do
    visit affiliate_url(@affiliate)
    click_on "Destroy this affiliate", match: :first

    assert_text "Affiliate was successfully destroyed"
  end
end
