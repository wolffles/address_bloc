require_relative 'entry'

class AddressBook
  attr_reader :entries

  def initialize
    @entries = []
  end
  def add_entry(name, phone_number, email)
    #9 true if name lexicographically proceeds entry.name, else continue testing until true "a" < "b" == true
    index = 0
    entries.each do |entry|
      if name < entry.name
        break
      end
      index += 1
    end
    #11 drops argument where the index is  and any other index/elements gets shifted +1
    entries.insert(index,Entry.new(name,phone_number,email))
  end

  def remove_entry(name,phone_number,email)
    entries.delete_if{|x|
      x.name == name && x.phone_number == phone_number && x.email == email
    }
  end
end
