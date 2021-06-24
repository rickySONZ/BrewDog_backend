require "test_helper"

class CapsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cap = caps(:one)
  end

  test "should get index" do
    get caps_url, as: :json
    assert_response :success
  end

  test "should create cap" do
    assert_difference('Cap.count') do
      post caps_url, params: { cap: { amount: @cap.amount, month: @cap.month } }, as: :json
    end

    assert_response 201
  end

  test "should show cap" do
    get cap_url(@cap), as: :json
    assert_response :success
  end

  test "should update cap" do
    patch cap_url(@cap), params: { cap: { amount: @cap.amount, month: @cap.month } }, as: :json
    assert_response 200
  end

  test "should destroy cap" do
    assert_difference('Cap.count', -1) do
      delete cap_url(@cap), as: :json
    end

    assert_response 204
  end
end
