require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
  test "get new category from and create category" do
    # we have to emulate creating a category
    # you're going through new category path
    get new_category_path 
    # in rails assert_template has been to a gem, so add the gem 'rails-controller-testing' and run 'bundle install' before you can run this method
    # you're getting the new form
    assert_template 'categories/new' 
    # you're posting to the new form creating this category sports
    assert_difference 'Category.count', 1 do
      post categories_path, params: { category:{name: "sports"}} 
      # which is redirecting you to the index page
      follow_redirect!
    end
    # ommit this line for rails 5, this is similar to follow_redirect!
    # assert_template 'categories/index'

    # and the index page should have sports now that you have create the category sports displayed in the page
    assert_match "sports", response.body
  end
end