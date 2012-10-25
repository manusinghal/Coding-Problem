require File.dirname(__FILE__) + '/discount.rb'
/.* This Billing class initializes list of Item in the bucket and the user for which the bill is being generated.
This class would also calculate the total discounts at the end and would also show the bill for each of the customer or employee .*/
class Billing
	attr_accessor :list_of_items, :user

	def initialize(list_of_items, user)
		@list_of_items = list_of_items
		@user = user
	end

	def show_bill
		amount = 0
		puts " ===== " + @user.name + " ===== "
		@list_of_items.each do |item|
			after_discount = item.calculate_discount(@user)
			amount =  amount + after_discount
			puts "  " + item.name + "  " + item.price.to_s + " " + after_discount.to_s			
		end
		puts "  == Total :" + after_total_value_discount(amount).to_s + " == \n\n"
	end

	def after_total_value_discount amount
		(amount > Discount::CUMULATIVE_DISCOUNT_PRICE)? (amount - amount * Discount::CUMULATIVE_DISCOUNT/100) : amount
	end

end