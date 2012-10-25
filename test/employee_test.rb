require File.dirname(__FILE__) + '/../model/employee.rb'
require "test/unit"

class EmployeeTest < Test::Unit::TestCase
  def setup
	@employee =  Employee.new("Manu", Time.now)
  end

  def test_creation
	assert_equal("Manu", @employee.name, "Employee not created with the name")
  end

  def test_creation_date
     @employee_default_creation_time = Employee.new("John")
     assert_not_nil(@employee_default_creation_time.created_at, "Creation time is Nil")
  end
  
  def test_discount
    assert_equal(70, @employee.discounted_amount(100), "Discount not applied correctly")
  end
end