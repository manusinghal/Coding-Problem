require File.dirname(__FILE__) + '/../model/customer.rb'
require "test/unit"

class CustomerTest < Test::Unit::TestCase

	def setup
		@customer_old =  Customer.new("Alet", (Time.now - 5*365*24*60*60), false)
		@customer_new = Customer.new("Bob", Time.now, false)
		@customer_old_affiliate =  Customer.new("Carol", (Time.now - 5*365*24*60*60), true)
		@customer_new_affiliate = Customer.new("Daniel", Time.now, true)
		@user_default_creation_time = User.new("Evgeny")
	end

	def test_creation
		assert_equal("Alet", @customer_old.name, "Customer not created with the name")
		assert_equal("Bob", @customer_new.name, "Customer not created with the name")
	end
	
	def test_creation_date
		assert_not_nil(@user_default_creation_time.created_at, "Creation time is Nil")
	end
	
	def test_affiliation
		assert_equal(false, @customer_old.isAffiliate, "Customer affiliation incorrect")
		assert_equal(true, @customer_old_affiliate.isAffiliate, "Customer affiliation incorrect")
	end

	def test_old_customer
		assert_equal(true, @customer_old.applicable_for_old_customer_discount?, "Customer is not qualified for loyalty discount")
		assert_equal(false, @customer_new.applicable_for_old_customer_discount?, "Customer is qualified for loyalty discount")
	end

	def test_affilate_discount
		assert_equal(100, @customer_new.affiliate_discount(100), "Affiliate should not be applicable here")
		assert_equal(90, @customer_new_affiliate.affiliate_discount(100), "Affiliate should be applicable here")
	end

	def test_for_old_customer_discount
		assert_equal(95, @customer_old.old_customer_discount(100), "Old customer discount should be applicable")
		assert_equal(100, @customer_new.old_customer_discount(100), "Old customer discount should not be applicable here")
	end

	def test_for_applicable_discount_amount
		assert_equal(95, @customer_old.discounted_amount(100),"Only old customer discount should be applicable here")
		assert_equal(100, @customer_new.discounted_amount(100),"No customer discount should be applicable here")
		assert_equal(90, @customer_old_affiliate.discounted_amount(100),"Only Affiliate customer discount should be applicable here")
		assert_equal(90, @customer_new_affiliate.discounted_amount(100),"Only Affiliate customer discount should be applicable here")
	end

end