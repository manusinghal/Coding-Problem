require File.dirname(__FILE__) + '/../model/billing.rb'
require File.dirname(__FILE__) + '/../model/item.rb'
require File.dirname(__FILE__) + '/../model/customer.rb'
require File.dirname(__FILE__) + '/../model/employee.rb'
require "test/unit"

class BillingTest < Test::Unit::TestCase
    def setup
        @item1 = Item.new("Biscuits", 100, "grocery") 
        @item2 = Item.new("Shirt", 100, "Clothes")
        @item3 = Item.new("Racquet", 200, "Sports")
        @user1 = Customer.new("Avery", true, (Time.now - 3*365*24*60*60))
        @user2 = Employee.new("Dennison", Time.now)  
        @billing1 = Billing.new([@item1,@item2,@item3], @user1)
		@billing2 = Billing.new([@item1,@item2,@item3], @user2)
    end
	
	def test_calculate_total_amount_to_be_paid
		assert_equal(90, @billing1.after_total_value_discount(90), "Total discount miscalculated")
		assert_equal(190, @billing1.after_total_value_discount(200), "Total discount miscalculated")
	end

end
