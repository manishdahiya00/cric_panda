require "test_helper"

class GameRewardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @game_reward = game_rewards(:one)
  end

  test "should get index" do
    get game_rewards_url
    assert_response :success
  end

  test "should get new" do
    get new_game_reward_url
    assert_response :success
  end

  test "should create game_reward" do
    assert_difference("GameReward.count") do
      post game_rewards_url, params: { game_reward: { click_id: @game_reward.click_id, game_award_id: @game_reward.game_award_id, player_id: @game_reward.player_id, source: @game_reward.source, source_ip: @game_reward.source_ip, status: @game_reward.status } }
    end

    assert_redirected_to game_reward_url(GameReward.last)
  end

  test "should show game_reward" do
    get game_reward_url(@game_reward)
    assert_response :success
  end

  test "should get edit" do
    get edit_game_reward_url(@game_reward)
    assert_response :success
  end

  test "should update game_reward" do
    patch game_reward_url(@game_reward), params: { game_reward: { click_id: @game_reward.click_id, game_award_id: @game_reward.game_award_id, player_id: @game_reward.player_id, source: @game_reward.source, source_ip: @game_reward.source_ip, status: @game_reward.status } }
    assert_redirected_to game_reward_url(@game_reward)
  end

  test "should destroy game_reward" do
    assert_difference("GameReward.count", -1) do
      delete game_reward_url(@game_reward)
    end

    assert_redirected_to game_rewards_url
  end
end
