require "application_system_test_case"

class TermAndConditionsTest < ApplicationSystemTestCase
  setup do
    @term_and_condition = term_and_conditions(:one)
  end

  test "visiting the index" do
    visit term_and_conditions_url
    assert_selector "h1", text: "Term and conditions"
  end

  test "should create term and condition" do
    visit term_and_conditions_url
    click_on "New term and condition"

    fill_in "Content", with: @term_and_condition.content
    click_on "Create Term and condition"

    assert_text "Term and condition was successfully created"
    click_on "Back"
  end

  test "should update Term and condition" do
    visit term_and_condition_url(@term_and_condition)
    click_on "Edit this term and condition", match: :first

    fill_in "Content", with: @term_and_condition.content
    click_on "Update Term and condition"

    assert_text "Term and condition was successfully updated"
    click_on "Back"
  end

  test "should destroy Term and condition" do
    visit term_and_condition_url(@term_and_condition)
    click_on "Destroy this term and condition", match: :first

    assert_text "Term and condition was successfully destroyed"
  end
end
