require "application_system_test_case"

class ListRedeemsTest < ApplicationSystemTestCase
  setup do
    @list_redeem = list_redeems(:one)
  end

  test "visiting the index" do
    visit list_redeems_url
    assert_selector "h1", text: "List redeems"
  end

  test "should create list redeem" do
    visit list_redeems_url
    click_on "New list redeem"

    fill_in "Pay amount", with: @list_redeem.pay_amount
    fill_in "Pay coin", with: @list_redeem.pay_coin
    fill_in "Pay email", with: @list_redeem.pay_email
    fill_in "Pay phone", with: @list_redeem.pay_phone
    fill_in "Pay type", with: @list_redeem.pay_type
    fill_in "Pay vendor", with: @list_redeem.pay_vendor
    fill_in "Ref user", with: @list_redeem.ref_user_id
    fill_in "Status", with: @list_redeem.status
    fill_in "Upi", with: @list_redeem.upi_id
    click_on "Create List redeem"

    assert_text "List redeem was successfully created"
    click_on "Back"
  end

  test "should update List redeem" do
    visit list_redeem_url(@list_redeem)
    click_on "Edit this list redeem", match: :first

    fill_in "Pay amount", with: @list_redeem.pay_amount
    fill_in "Pay coin", with: @list_redeem.pay_coin
    fill_in "Pay email", with: @list_redeem.pay_email
    fill_in "Pay phone", with: @list_redeem.pay_phone
    fill_in "Pay type", with: @list_redeem.pay_type
    fill_in "Pay vendor", with: @list_redeem.pay_vendor
    fill_in "Ref user", with: @list_redeem.ref_user_id
    fill_in "Status", with: @list_redeem.status
    fill_in "Upi", with: @list_redeem.upi_id
    click_on "Update List redeem"

    assert_text "List redeem was successfully updated"
    click_on "Back"
  end

  test "should destroy List redeem" do
    visit list_redeem_url(@list_redeem)
    click_on "Destroy this list redeem", match: :first

    assert_text "List redeem was successfully destroyed"
  end
end
