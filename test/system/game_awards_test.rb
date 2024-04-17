require "application_system_test_case"

class GameAwardsTest < ApplicationSystemTestCase
  setup do
    @game_award = game_awards(:one)
  end

  test "visiting the index" do
    visit game_awards_url
    assert_selector "h1", text: "Game awards"
  end

  test "should create game award" do
    visit game_awards_url
    click_on "New game award"

    fill_in "Identifier", with: @game_award.identifier
    fill_in "Image url", with: @game_award.image_url
    fill_in "Input name", with: @game_award.input_name
    fill_in "Publisher", with: @game_award.publisher
    fill_in "Redirect url", with: @game_award.redirect_url
    fill_in "Rules", with: @game_award.rules
    check "Status" if @game_award.status
    fill_in "Title", with: @game_award.title
    click_on "Create Game award"

    assert_text "Game award was successfully created"
    click_on "Back"
  end

  test "should update Game award" do
    visit game_award_url(@game_award)
    click_on "Edit this game award", match: :first

    fill_in "Identifier", with: @game_award.identifier
    fill_in "Image url", with: @game_award.image_url
    fill_in "Input name", with: @game_award.input_name
    fill_in "Publisher", with: @game_award.publisher
    fill_in "Redirect url", with: @game_award.redirect_url
    fill_in "Rules", with: @game_award.rules
    check "Status" if @game_award.status
    fill_in "Title", with: @game_award.title
    click_on "Update Game award"

    assert_text "Game award was successfully updated"
    click_on "Back"
  end

  test "should destroy Game award" do
    visit game_award_url(@game_award)
    click_on "Destroy this game award", match: :first

    assert_text "Game award was successfully destroyed"
  end
end
