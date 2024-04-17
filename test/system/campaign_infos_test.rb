require "application_system_test_case"

class CampaignInfosTest < ApplicationSystemTestCase
  setup do
    @campaign_info = campaign_infos(:one)
  end

  test "visiting the index" do
    visit campaign_infos_url
    assert_selector "h1", text: "Campaign infos"
  end

  test "should create campaign info" do
    visit campaign_infos_url
    click_on "New campaign info"

    fill_in "Amount", with: @campaign_info.amount
    fill_in "Identifier", with: @campaign_info.identifier
    fill_in "Offer steps", with: @campaign_info.offer_steps
    fill_in "Publisher", with: @campaign_info.publisher
    fill_in "Redirect url", with: @campaign_info.redirect_url
    fill_in "Source", with: @campaign_info.source
    check "Status" if @campaign_info.status
    fill_in "Terms n condition", with: @campaign_info.terms_n_condition
    fill_in "Title", with: @campaign_info.title
    click_on "Create Campaign info"

    assert_text "Campaign info was successfully created"
    click_on "Back"
  end

  test "should update Campaign info" do
    visit campaign_info_url(@campaign_info)
    click_on "Edit this campaign info", match: :first

    fill_in "Amount", with: @campaign_info.amount
    fill_in "Identifier", with: @campaign_info.identifier
    fill_in "Offer steps", with: @campaign_info.offer_steps
    fill_in "Publisher", with: @campaign_info.publisher
    fill_in "Redirect url", with: @campaign_info.redirect_url
    fill_in "Source", with: @campaign_info.source
    check "Status" if @campaign_info.status
    fill_in "Terms n condition", with: @campaign_info.terms_n_condition
    fill_in "Title", with: @campaign_info.title
    click_on "Update Campaign info"

    assert_text "Campaign info was successfully updated"
    click_on "Back"
  end

  test "should destroy Campaign info" do
    visit campaign_info_url(@campaign_info)
    click_on "Destroy this campaign info", match: :first

    assert_text "Campaign info was successfully destroyed"
  end
end
