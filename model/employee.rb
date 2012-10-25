require File.dirname(__FILE__) + '/user.rb'
/.* This is the Employee class initializing Name and created time of the employee. 
This class would also calculate the discount applicable for employees .*/
class Employee < User

	def initialize(name, created_at = Time.now)
	  super(name, created_at)
	end

	def discounted_amount(amount)
		amount - amount * Discount::EMPLOYEE_DISCOUNT/100
	end
end