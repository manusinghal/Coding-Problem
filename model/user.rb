require File.dirname(__FILE__) + '/discount.rb'
/.* This class is super class of Customer and Employee, having common attributes etc. .*/
class User
	attr_accessor :name, :created_at

	def initialize(name, created_at = Time.now)
		@name, @created_at = name, created_at
	end
end