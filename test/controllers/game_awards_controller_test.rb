require "test_helper"

class GameAwardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @game_award = game_awards(:one)
  end

  test "should get index" do
    get game_awards_url
    assert_response :success
  end

  test "should get new" do
    get new_game_award_url
    assert_response :success
  end

  test "should create game_award" do
    assert_difference("GameAward.count") do
      post game_awards_url, params: { game_award: { identifier: @game_award.identifier, image_url: @game_award.image_url, input_name: @game_award.input_name, publisher: @game_award.publisher, redirect_url: @game_award.redirect_url, rules: @game_award.rules, status: @game_award.status, title: @game_award.title } }
    end

    assert_redirected_to game_award_url(GameAward.last)
  end

  test "should show game_award" do
    get game_award_url(@game_award)
    assert_response :success
  end

  test "should get edit" do
    get edit_game_award_url(@game_award)
    assert_response :success
  end

  test "should update game_award" do
    patch game_award_url(@game_award), params: { game_award: { identifier: @game_award.identifier, image_url: @game_award.image_url, input_name: @game_award.input_name, publisher: @game_award.publisher, redirect_url: @game_award.redirect_url, rules: @game_award.rules, status: @game_award.status, title: @game_award.title } }
    assert_redirected_to game_award_url(@game_award)
  end

  test "should destroy game_award" do
    assert_difference("GameAward.count", -1) do
      delete game_award_url(@game_award)
    end

    assert_redirected_to game_awards_url
  end
end
