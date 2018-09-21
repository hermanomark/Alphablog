require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  # this is a key method, this method runs before everyone of your test
  def setup
    # this will hit your database, this will only hit the test database
    @category = Category.new(name: "sports")
  end

  test "category should be valid" do
    # basically can we initiate a new category instance variable if it's valid
    assert @category.valid?
  end

  test "name should be present" do
    @category.name = " "
    assert_not @category.valid?
  end

  test "name should be unique" do
    # it will hit the database first
    @category.save
    category2 = Category.new(name: "sports")
    assert_not category2.valid?
  end

  test "name should not be too long" do
    @category.name = "a" * 26
    assert_not @category.valid?
  end

  test "name should not be too short" do
    @category.name = "aa"
    assert_not @category.valid?
  end
end