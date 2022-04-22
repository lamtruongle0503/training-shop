require 'test_helper'

class Admin::ChartsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_charts_index_url
    assert_response :success
  end

end
