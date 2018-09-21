require 'test_helper'

# rails 5
class CategoriesControllerTest < ActionDispatch::IntegrationTest
  def setup
    # in show we need to pass the id
    # in rails 5 we'll pass the @category object itself (not just id) since we're using IntegrationTest
    @category = Category.create(name: "sports")
  end
  
  test "should get categories index" do
    # this is rails 5
    get categories_path
    assert_response :success
  end

  test "should get new" do
    get new_category_path
    assert_response :success
  end

  test "should get show" do
    get category_path(@category)
    assert_response :success
  end
end