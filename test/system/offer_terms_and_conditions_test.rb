require "application_system_test_case"

class OfferTermsAndConditionsTest < ApplicationSystemTestCase
  setup do
    @offer_terms_and_condition = offer_terms_and_conditions(:one)
  end

  test "visiting the index" do
    visit offer_terms_and_conditions_url
    assert_selector "h1", text: "Offer terms and conditions"
  end

  test "should create offer terms and condition" do
    visit offer_terms_and_conditions_url
    click_on "New offer terms and condition"

    fill_in "Content", with: @offer_terms_and_condition.content
    click_on "Create Offer terms and condition"

    assert_text "Offer terms and condition was successfully created"
    click_on "Back"
  end

  test "should update Offer terms and condition" do
    visit offer_terms_and_condition_url(@offer_terms_and_condition)
    click_on "Edit this offer terms and condition", match: :first

    fill_in "Content", with: @offer_terms_and_condition.content
    click_on "Update Offer terms and condition"

    assert_text "Offer terms and condition was successfully updated"
    click_on "Back"
  end

  test "should destroy Offer terms and condition" do
    visit offer_terms_and_condition_url(@offer_terms_and_condition)
    click_on "Destroy this offer terms and condition", match: :first

    assert_text "Offer terms and condition was successfully destroyed"
  end
end
