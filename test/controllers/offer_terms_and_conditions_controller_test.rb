require "test_helper"

class OfferTermsAndConditionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @offer_terms_and_condition = offer_terms_and_conditions(:one)
  end

  test "should get index" do
    get offer_terms_and_conditions_url
    assert_response :success
  end

  test "should get new" do
    get new_offer_terms_and_condition_url
    assert_response :success
  end

  test "should create offer_terms_and_condition" do
    assert_difference("OfferTermsAndCondition.count") do
      post offer_terms_and_conditions_url, params: { offer_terms_and_condition: { content: @offer_terms_and_condition.content } }
    end

    assert_redirected_to offer_terms_and_condition_url(OfferTermsAndCondition.last)
  end

  test "should show offer_terms_and_condition" do
    get offer_terms_and_condition_url(@offer_terms_and_condition)
    assert_response :success
  end

  test "should get edit" do
    get edit_offer_terms_and_condition_url(@offer_terms_and_condition)
    assert_response :success
  end

  test "should update offer_terms_and_condition" do
    patch offer_terms_and_condition_url(@offer_terms_and_condition), params: { offer_terms_and_condition: { content: @offer_terms_and_condition.content } }
    assert_redirected_to offer_terms_and_condition_url(@offer_terms_and_condition)
  end

  test "should destroy offer_terms_and_condition" do
    assert_difference("OfferTermsAndCondition.count", -1) do
      delete offer_terms_and_condition_url(@offer_terms_and_condition)
    end

    assert_redirected_to offer_terms_and_conditions_url
  end
end
