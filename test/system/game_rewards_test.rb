require "application_system_test_case"

class GameRewardsTest < ApplicationSystemTestCase
  setup do
    @game_reward = game_rewards(:one)
  end

  test "visiting the index" do
    visit game_rewards_url
    assert_selector "h1", text: "Game rewards"
  end

  test "should create game reward" do
    visit game_rewards_url
    click_on "New game reward"

    fill_in "Click", with: @game_reward.click_id
    fill_in "Game award", with: @game_reward.game_award_id
    fill_in "Player", with: @game_reward.player_id
    fill_in "Source", with: @game_reward.source
    fill_in "Source ip", with: @game_reward.source_ip
    check "Status" if @game_reward.status
    click_on "Create Game reward"

    assert_text "Game reward was successfully created"
    click_on "Back"
  end

  test "should update Game reward" do
    visit game_reward_url(@game_reward)
    click_on "Edit this game reward", match: :first

    fill_in "Click", with: @game_reward.click_id
    fill_in "Game award", with: @game_reward.game_award_id
    fill_in "Player", with: @game_reward.player_id
    fill_in "Source", with: @game_reward.source
    fill_in "Source ip", with: @game_reward.source_ip
    check "Status" if @game_reward.status
    click_on "Update Game reward"

    assert_text "Game reward was successfully updated"
    click_on "Back"
  end

  test "should destroy Game reward" do
    visit game_reward_url(@game_reward)
    click_on "Destroy this game reward", match: :first

    assert_text "Game reward was successfully destroyed"
  end
end
