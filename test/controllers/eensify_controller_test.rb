require 'test_helper'

class EensifyControllerTest < ActionDispatch::IntegrationTest

  setup do
    @url = urls(:one)
  end

  test "should create short url" do
    assert_difference('Url.count') do
      post "/", params: { urls: { longUrl: @url.longUrl }}
    end

    assert_response :success
    assert_template :show
  end

  test "should show index" do
    get "/"

    assert_response :success
    assert_template :index
  end

  test "show should redirect for valid url" do
    # todo
  end

  test "show should send to error for valid url not found" do
    # todo
  end

  test "show should send to error for invalid url" do
    # todo
  end

  test "should base62 decode valid string" do
    assert_equal 3893, EensifyController.new.base62_decode("baX")
  end

  test "should return error on base62 decode of invalid string" do
    assert_equal "error", EensifyController.new.base62_decode("baX@")
  end

end
