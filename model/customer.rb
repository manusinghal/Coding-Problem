require File.dirname(__FILE__) + '/user.rb'
/.* This Customer class initializes Name and created timestamp.
This class would also calculate the discounts for the Customer, depending on various conditons - old customers, affiliates etc .*/
class Customer < User
	attr_accessor :isAffiliate
	
	def initialize(name, created_at = Time.now, isAffiliate = false)
		super(name, created_at)
		@isAffiliate = isAffiliate
	end
	
	/.* This would give the discounted amount after checking which ever gives more discount out of old customer discount or affiliate discount.*/
	def discounted_amount amount
		after_old_customer_discount =  old_customer_discount(amount) 
		amount_after_affiliate_dis =  affiliate_discount(amount)
		return (after_old_customer_discount < amount_after_affiliate_dis) ? after_old_customer_discount : amount_after_affiliate_dis
	end
	
	/.* This would return the old customer discounted amount after checking if the customer qualifies for the discount .*/
	def old_customer_discount amount
	    return (applicable_for_old_customer_discount?) ? (amount - amount * Discount::PLATINUM_CUSTOMER_DISCOUNT_PER / 100) : amount
	end

	/.* This would return how old is the customer, which would help in calculating old customer discount .*/
	def old_in_years
		return (Time.now - self.created_at)/(365*24*60*60)  if !self.created_at.nil?
		raise "Created time is not there"
	end
	
	/.* This returns whether the customer qualifies for the old customer discount or not .*/
	def applicable_for_old_customer_discount?
		old_in_years > Discount::PLATINUM_CUSTOMER_YEARS 
	end

	/.* This would return the discounted amount after checking if the customer qualifies for the affiliate discount .*/
	def affiliate_discount amount
		return (isAffiliate)? (amount - amount * Discount::AFFILIATE_DISCOUNT_PER / 100) : amount
    end

end