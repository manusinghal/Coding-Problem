Dir[File.dirname(__FILE__) + '/../model/*.rb'].each {|file| require file }
require "test/unit"

class ItemTest < Test::Unit::TestCase
  def setup
    @item1 = Item.new("Biscuits", 100, "grocery")
    @item2 = Item.new("Shirt", 100, "clothes")
    @old_customer_affiliate = Customer.new("Alet", (Time.now - 3*365*24*60*60), true)
	@old_customer = Customer.new("Ben", (Time.now - 3*365*24*60*60), false)
	@new_customer_affiliate = Customer.new("Carol", Time.now, true)
	@new_customer = Customer.new("Daniel", Time.now, false)
    @old_employee = Employee.new("Evgeny", (Time.now - 3*365*24*60*60))
	@new_employee = Employee.new("Fergusson", Time.now)    
  end

  def test_creation
	assert_equal("Biscuits", @item1.name, "Item not created with the name")
	assert_equal("Ben", @old_customer.name, "Customer not created with the name")
	assert_equal("Daniel", @new_customer.name, "Customer not created with the name")
	assert_equal("Evgeny", @old_employee.name, "Employee not created with the name")
	assert_equal("Fergusson", @new_employee.name, "Employee not created with the name")
  end

  def test_item_in_discount_list
	assert_equal(true, @item1.is_item_in_discount_list?, "Item is not in the discount list")
	assert_equal(false, @item2.is_item_in_discount_list?, "Item is in the discount list")
  end

  def test_calculate_discount
	assert_equal(100, @item1.calculate_discount(@old_customer_affiliate), "Discount not applied correctly")
	assert_equal(100, @item1.calculate_discount(@old_customer), "Discount not applied correctly")
	assert_equal(100, @item1.calculate_discount(@new_customer_affiliate), "Discount not applied correctly")
	assert_equal(100, @item1.calculate_discount(@new_customer), "Discount not applied correctly")
	assert_equal(100, @item1.calculate_discount(@old_employee), "Discount not applied correctly")
	assert_equal(100, @item1.calculate_discount(@new_employee), "Discount not applied correctly")
	assert_equal(90, @item2.calculate_discount(@old_customer_affiliate), "Discount not applied correctly")
	assert_equal(95, @item2.calculate_discount(@old_customer), "Discount not applied correctly")
	assert_equal(90, @item2.calculate_discount(@new_customer_affiliate), "Discount not applied correctly")
	assert_equal(100, @item2.calculate_discount(@new_customer), "Discount not applied correctly")
	assert_equal(70, @item2.calculate_discount(@old_employee), "Discount not applied correctly")
	assert_equal(70, @item2.calculate_discount(@new_employee), "Discount not applied correctly")
  end
end