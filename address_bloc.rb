require_relative  'controllers/menu_controller'
#this is where your app starts
menu = MenuController.new
# system is a built in method that is similar to backticks`` or %x(). slight differences occur on how it effects STDIN
system "clear"
puts "Welcome to AddressBloc!"
#6 this below calls the controller from menu_controller.rb
menu.main_menu
