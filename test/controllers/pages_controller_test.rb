require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get hello" do
    get pages_hello_url
    assert_response :success
  end

  test "should get sum" do
    get pages_sum_url
    assert_response :success
  end

  test "should get reverse-words" do
    get pages_reverse-words_url
    assert_response :success
  end

end
