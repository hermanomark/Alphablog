require 'test_helper'

# rails 5
class CategoriesControllerTest < ActionDispatch::IntegrationTest
  def setup
    # in show we need to pass the id
    # in rails 5 we'll pass the @category object itself (not just id) since we're using IntegrationTest
    @category = Category.create(name: "sports")
    # create an admin for the test
    @user = User.create(username: "john", email: "john@example.com", password: "password", admin: true)
  end
  
  test "should get categories index" do
    # this is rails 5
    get categories_path
    assert_response :success
  end

  test "should get new" do
    # we need to simulate the admin john to login
    sign_in_as(@user, "password")
    get new_category_path
    assert_response :success
  end

  test "should get show" do
    get category_path(@category)
    assert_response :success
  end

  test "should redirect create when admin not logged in" do
    # aseert no differenct in category.count when this action happens, post to the create action the category with name sports
    assert_no_difference 'Category.count' do
      post categories_path, params: { category:{name: "sports"}}
    end
    assert_redirected_to categories_path 
  end
end