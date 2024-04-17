require "test_helper"

class TermAndConditionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @term_and_condition = term_and_conditions(:one)
  end

  test "should get index" do
    get term_and_conditions_url
    assert_response :success
  end

  test "should get new" do
    get new_term_and_condition_url
    assert_response :success
  end

  test "should create term_and_condition" do
    assert_difference("TermAndCondition.count") do
      post term_and_conditions_url, params: { term_and_condition: { content: @term_and_condition.content } }
    end

    assert_redirected_to term_and_condition_url(TermAndCondition.last)
  end

  test "should show term_and_condition" do
    get term_and_condition_url(@term_and_condition)
    assert_response :success
  end

  test "should get edit" do
    get edit_term_and_condition_url(@term_and_condition)
    assert_response :success
  end

  test "should update term_and_condition" do
    patch term_and_condition_url(@term_and_condition), params: { term_and_condition: { content: @term_and_condition.content } }
    assert_redirected_to term_and_condition_url(@term_and_condition)
  end

  test "should destroy term_and_condition" do
    assert_difference("TermAndCondition.count", -1) do
      delete term_and_condition_url(@term_and_condition)
    end

    assert_redirected_to term_and_conditions_url
  end
end
