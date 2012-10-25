require File.dirname(__FILE__) + '/discount.rb'
/.* This is the Item class initializing Name, Price, Type of item. This class would also calculate the discount for the Item type .*/
class Item
	attr_accessor :name, :type, :price

	def initialize(name, price, type)
		@name, @price, @type = name, price, type
	end

	def is_item_in_discount_list?
		(Discount::EXCLUDED_DISCOUNT_ITEMS.include?(@type))
	end

	def calculate_discount user
	  (Discount::EXCLUDED_DISCOUNT_ITEMS.include?(@type))? @price : user.discounted_amount(@price)
	end
end