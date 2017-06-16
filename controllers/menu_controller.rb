require_relative '../models/address_book'
class MenuController
  attr_reader :address_book

  def initialize
    @address_book = AddressBook.new
  end
  def main_menu
    puts "Main Menu - #{address_book.entries.count} entries"
    puts "1 - View all entries"
    puts "2 - Create an entry"
    puts "3 - Search for an entry"
    puts "4 - Import entries from a CSV"
    puts "5 - Exit"
    print "Enter your selection: "

    selection = gets.to_i
    # now we're handling the input instead of having a puts "you picked #{selection}"

    #1 using case statement to handle inputs
    case selection
      when 1
        system "clear"
        view_all_entries
        main_menu
      when 2
        system "clear"
        create_entry
        main_menu
      when 3
        system "clear"
        search_entries
        main_menu
      when 4
        system "clear"
        read_csv
        main_menu
      when 5
        puts "Good-bye!"
        #2 terminate the program using exit(0) 0 signals the program is exiting without an error.
        exit(0)
      else
        system "clear"
        puts "Sorry,that is not a valid input"
        main_menu
      end
  end

  def view_all_entries
    #6 iterate
    address_book.entries.each do |entry|
      system "clear"
      puts entry.to_s
      #7 defined below the menu methods
      entry_submenu(entry)
    end
    system "clear"
    puts "End of entries"
  end

  def create_entry
    system "clear"
    puts "New AddressBloc Entry"
    #4 used print here because although print works like puts it doesnt add a new line.
    print "Name: "
    name = gets.chomp
    print "Phone number: "
    phone_number = gets.chomp
    print "Email: "
    email = gets.chomp

    #5 uses add_entry from address_book.rb
    address_book.add_entry(name,phone_number,email).

    system "clear"
    puts "New entry created"
  end

  def search_entries
  end

  def read_csv
  end

  def entry_submenu(entry)
    puts 'n - next entry'
    puts 'd - delete entry'
    puts 'e - edit this entry'
    puts 'm - return to main menu'

    selection = gets.chomp

    case selection
    when "n"
    when "d"
    when "e"
    when "m"
      system "clear"
      main_menu
    else
      system "clear"
      puts "#{selection} is not a valid input"
      entry_submenu(entry)
    end
  end
end
