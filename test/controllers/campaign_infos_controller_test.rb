require "test_helper"

class CampaignInfosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @campaign_info = campaign_infos(:one)
  end

  test "should get index" do
    get campaign_infos_url
    assert_response :success
  end

  test "should get new" do
    get new_campaign_info_url
    assert_response :success
  end

  test "should create campaign_info" do
    assert_difference("CampaignInfo.count") do
      post campaign_infos_url, params: { campaign_info: { amount: @campaign_info.amount, identifier: @campaign_info.identifier, offer_steps: @campaign_info.offer_steps, publisher: @campaign_info.publisher, redirect_url: @campaign_info.redirect_url, source: @campaign_info.source, status: @campaign_info.status, terms_n_condition: @campaign_info.terms_n_condition, title: @campaign_info.title } }
    end

    assert_redirected_to campaign_info_url(CampaignInfo.last)
  end

  test "should show campaign_info" do
    get campaign_info_url(@campaign_info)
    assert_response :success
  end

  test "should get edit" do
    get edit_campaign_info_url(@campaign_info)
    assert_response :success
  end

  test "should update campaign_info" do
    patch campaign_info_url(@campaign_info), params: { campaign_info: { amount: @campaign_info.amount, identifier: @campaign_info.identifier, offer_steps: @campaign_info.offer_steps, publisher: @campaign_info.publisher, redirect_url: @campaign_info.redirect_url, source: @campaign_info.source, status: @campaign_info.status, terms_n_condition: @campaign_info.terms_n_condition, title: @campaign_info.title } }
    assert_redirected_to campaign_info_url(@campaign_info)
  end

  test "should destroy campaign_info" do
    assert_difference("CampaignInfo.count", -1) do
      delete campaign_info_url(@campaign_info)
    end

    assert_redirected_to campaign_infos_url
  end
end
