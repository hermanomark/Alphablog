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

  test "invalid category submission results in failure" do
    get new_category_path
    assert_template 'categories/new' 
    assert_no_difference 'Category.count' do
      post categories_path, params: { category:{name: ""}} 
      # in rails 5 should remove this line
      # follow_redirect!
    end
    assert_template 'categories/new'
    # your getting this from views / shared / errors.html.erb, this is howw you reference it
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end
end