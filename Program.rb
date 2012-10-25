Dir[File.dirname(__FILE__) + '/model/*.rb'].each {|file| require file }
/.* File to show the working of the program for various scenarios, can modify or add more to your need .*/

  @item1 = Item.new("Biscuit", 100, "grocery")
  @item2 = Item.new("Trouser", 100, "clothes")
  @item3 = Item.new("Racquet", 200, "sports")
  
  /.* Customer more than 2 years old and is an affiliate too .*/
  @user1 = Customer.new("Alet", (Time.now - 3*365*24*60*60), true)
  @billing1 = Billing.new([@item1,@item2,@item3], @user1)
  @billing1.show_bill

  /.* Customer more than 2 years old and is not an affiliate too .*/
  @user2 = Customer.new("Ben", (Time.now - 3*365*24*60*60), false)
  @billing1 = Billing.new([@item1,@item2,@item3], @user2)
  @billing1.show_bill
 
  /.* Customer less than 2 years old and is a affiliate too .*/ 
  @user3 = Customer.new("Carol", Time.now, true)
  @billing1 = Billing.new([@item1,@item2,@item3], @user3)
  @billing1.show_bill
  
  /.* Customer less than 2 years old and is not an affiliate too .*/
  @user4 = Customer.new("Daniel", Time.now, false)
  @billing1 = Billing.new([@item1,@item2,@item3], @user4)
  @billing1.show_bill
  
  /.* Employee more than 2 years old .*/
  @user5 = Employee.new("Evgeny", (Time.now - 3*365*24*60*60))
  @billing2 = Billing.new([@item1,@item2,@item3], @user5)
  @billing2.show_bill
  
  /.* Employee less than 2 years old .*/
  @user6 = Employee.new("Feming", Time.now)
  @billing2 = Billing.new([@item1,@item2,@item3], @user6)
  @billing2.show_bill