require "test_helper"

class ListRedeemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @list_redeem = list_redeems(:one)
  end

  test "should get index" do
    get list_redeems_url
    assert_response :success
  end

  test "should get new" do
    get new_list_redeem_url
    assert_response :success
  end

  test "should create list_redeem" do
    assert_difference("ListRedeem.count") do
      post list_redeems_url, params: { list_redeem: { pay_amount: @list_redeem.pay_amount, pay_coin: @list_redeem.pay_coin, pay_email: @list_redeem.pay_email, pay_phone: @list_redeem.pay_phone, pay_type: @list_redeem.pay_type, pay_vendor: @list_redeem.pay_vendor, ref_user_id: @list_redeem.ref_user_id, status: @list_redeem.status, upi_id: @list_redeem.upi_id } }
    end

    assert_redirected_to list_redeem_url(ListRedeem.last)
  end

  test "should show list_redeem" do
    get list_redeem_url(@list_redeem)
    assert_response :success
  end

  test "should get edit" do
    get edit_list_redeem_url(@list_redeem)
    assert_response :success
  end

  test "should update list_redeem" do
    patch list_redeem_url(@list_redeem), params: { list_redeem: { pay_amount: @list_redeem.pay_amount, pay_coin: @list_redeem.pay_coin, pay_email: @list_redeem.pay_email, pay_phone: @list_redeem.pay_phone, pay_type: @list_redeem.pay_type, pay_vendor: @list_redeem.pay_vendor, ref_user_id: @list_redeem.ref_user_id, status: @list_redeem.status, upi_id: @list_redeem.upi_id } }
    assert_redirected_to list_redeem_url(@list_redeem)
  end

  test "should destroy list_redeem" do
    assert_difference("ListRedeem.count", -1) do
      delete list_redeem_url(@list_redeem)
    end

    assert_redirected_to list_redeems_url
  end
end
