require File.dirname(__FILE__) + '/../model/user.rb'
require "test/unit"

class UserTest < Test::Unit::TestCase
  def setup
     @user =  User.new("Manu", Time.now)
  end

  def test_create
     assert_equal("Manu", @user.name, "User not created with the name")
  end

  def test_creation_date
     @user_default_creation_time = User.new("John")
     assert_not_nil(@user_default_creation_time.created_at, "Creation time is Nil")
  end

end