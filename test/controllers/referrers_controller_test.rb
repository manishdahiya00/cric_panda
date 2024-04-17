require "test_helper"

class ReferrersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @referrer = referrers(:one)
  end

  test "should get index" do
    get referrers_url
    assert_response :success
  end

  test "should get new" do
    get new_referrer_url
    assert_response :success
  end

  test "should create referrer" do
    assert_difference("Referrer.count") do
      post referrers_url, params: { referrer: { aff_order_id: @referrer.aff_order_id, aff_pay_response: @referrer.aff_pay_response, aff_status: @referrer.aff_status, affiliate_id: @referrer.affiliate_id, app_offer_id: @referrer.app_offer_id, click_id: @referrer.click_id, live_offer_id: @referrer.live_offer_id, paytm_number: @referrer.paytm_number, ref_pay_response: @referrer.ref_pay_response, ref_status: @referrer.ref_status, source_ip: @referrer.source_ip, telegram_id: @referrer.telegram_id, upi_id: @referrer.upi_id } }
    end

    assert_redirected_to referrer_url(Referrer.last)
  end

  test "should show referrer" do
    get referrer_url(@referrer)
    assert_response :success
  end

  test "should get edit" do
    get edit_referrer_url(@referrer)
    assert_response :success
  end

  test "should update referrer" do
    patch referrer_url(@referrer), params: { referrer: { aff_order_id: @referrer.aff_order_id, aff_pay_response: @referrer.aff_pay_response, aff_status: @referrer.aff_status, affiliate_id: @referrer.affiliate_id, app_offer_id: @referrer.app_offer_id, click_id: @referrer.click_id, live_offer_id: @referrer.live_offer_id, paytm_number: @referrer.paytm_number, ref_pay_response: @referrer.ref_pay_response, ref_status: @referrer.ref_status, source_ip: @referrer.source_ip, telegram_id: @referrer.telegram_id, upi_id: @referrer.upi_id } }
    assert_redirected_to referrer_url(@referrer)
  end

  test "should destroy referrer" do
    assert_difference("Referrer.count", -1) do
      delete referrer_url(@referrer)
    end

    assert_redirected_to referrers_url
  end
end
