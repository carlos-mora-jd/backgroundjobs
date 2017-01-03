require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get mensajes_new_url
    assert_response :success
  end

end
