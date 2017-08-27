require 'test_helper'

class EensifyHelperTest < ActionView::TestCase

  test "should base62 encode" do
    assert_equal "baX", base62_encode(3893)
  end

  test "should return eensy URL" do
    @url = Url.new({
      "longUrl" => "http://example.com",
      "id" => 3893 })
    assert_not_equal "OOPS! Request failed.", eensy_url(@url)

    assert_equal Rails.application.config.eensify_url + "baX", eensy_url(@url)
  end

  test "should return request failure when url not passed" do
    assert_equal "OOPS! Request failed.", eensy_url(nil)
  end

end
