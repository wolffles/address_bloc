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
    puts "5 - PROTOCOL_ZERO!!!! o.0"
    puts "6 - Exit"
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
        system "clear"
        protocol_zero
        main_menu
      when 6
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
    address_book.add_entry(name,phone_number,email)

    system "clear"
    puts "New entry created"
  end

  def search_entries #made the searches exact instead of if it includes but just showing i know the difference.
    puts "How would you like to search for the entry?"
    puts "1. Name"
    puts "2. Phone number"
    puts "3. Email"
    puts "4. Entry number"
    input = gets.chomp
    case input
    when '1'
        print "Name: "
        name = gets.chomp
        match = address_book.binary_search(name)
        system "clear"
        #11
        if match
          puts match.to_s
          search_submenu(match)
        else
          puts "No match found for #{name}"
        end
      when '2'
        print "Phone number: "
        input = gets.chomp
        match = address_book.entries.select{|x| x.phone_number == input }[0]
        system "clear"
        #11
        if match
          puts match.to_s
          search_submenu(match)
        else
          puts "No match found for #{name}"
        end
      when '3'
        print "Email: "
        input = gets.chomp
        match =  address_book.entries.select{|x| x.email == input }[0]
        system "clear"
        #11
        if match
          puts match.to_s
          search_submenu(match)
        else
          puts "No match found for #{name}"
        end
      when '4'
        print "Which entry number did you want?"
        input = gets.to_i
        match = address_book.entries[input - 1]
        system "clear"
        #11
        if match
          puts match.to_s
          search_submenu(match)
        else
          puts "No match found for #{name}"
        end
      else
        system "clear"
        puts "sorry that isn't a valid response"
        search_entries
      end
  end

  def read_csv
    #1
    print "Enter CSV file to import: "
    file_name = gets.chomp

    #2
    if file_name.empty?
      system "clear"
      puts "No CSV file read"
      main_menu
    end
    #3
    begin
      entry_count = address_book.import_from_csv(file_name.count)
      system "clear"
      puts "#{entry_count} new entries add from #{file_name}"
    rescue
      puts "#{file_name} is not a valid CSV file, please enter the name of a valid CSV file"
      read_csv
    end
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
      delete_entry(entry)
    when "e"
      edit_entry(entry)
    when "m"
      system "clear"
      main_menu
    else
      system "clear"
      puts "#{selection} is not a valid input"
      entry_submenu(entry)
    end
  end

  def search_submenu(entry)
    #12
    puts "\nd - delete entry"
    puts "e - edit this entry"
    puts "m - return to main menu"
    #13
    selection = gets.chomp

    #14
    case selection
    when "d"
      system "clear"
      delete_entry(entry)
      main_menu
    when "e"
      system "clear"
      edit_entry(entry)
      main_menu
    when "m"
      system "clear"
      main_menu
    else
      system "clear"
      puts "#{selection} is not a valid input"
      puts entry.to_s
      search_submenu(entry)
    end
  end

  def delete_entry(entry)
    address_book.entries.delete(entry)
    puts "#{entry.name} has been deleted"
  end

  def edit_entry(entry)
    print "Updated name: "
    name = gets.chomp
    print "Updated phone number: "
    phone_number = gets.chomp
    print "updated email: "
    email = gets.chomp
    #5
    entry.name = name if !name.empty?
    entry.phone_number = phone_number if !phone_number.empty?
    entry.email = email if !email.empty?
    system "clear"
    #6
    puts "updated entry: "
    puts entry
  end

  def protocol_zero
    address_book.entries.clear
    puts "you've gone Protocol Zero don't forget to nuke your hardware."
  end
end
