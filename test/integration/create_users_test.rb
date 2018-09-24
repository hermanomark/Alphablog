require 'test_helper'

class CreateUsersTest < ActionDispatch::IntegrationTest

  test "get new user from and signup" do
    get signup_path 
    assert_template 'users/new' 
    assert_difference 'User.count', 1 do
      post users_path, params: { user:{username: "willsmith", email: "willsmith@gmail.com", password: "password"}} 
      follow_redirect!
    end
    assert_match "willsmith", "willsmith@gmail.com", response.body
  end

  test "invalid user submission results in failure" do
    get signup_path 
    assert_template 'users/new'
    assert_no_difference 'User.count' do
      post users_path, params: { user:{username: "", email: "", passwor: ""}} 
    end
    assert_template 'users/new'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end
end