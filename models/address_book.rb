require_relative 'entry'
require 'csv'

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
  def import_from_csv(file_name)
    csv_text = File.read(file_name)
    csv = CSV.parse(csv_text, headers: true, skip_blanks: true)
  #8
    csv.each do |row|
      row_hash = row.to_hash
      add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
    end

    def binary_search(name)
      lower = 0
      upper = entries.length - 1
      while lower <= upper
        #3 find the value of the mid element
        mid = (lower + upper) / 2
        mid_name = entries[mid].name
        #4 this will shorten the search in half depending on the condition
        if name == mid_name
          return entries[mid]
        elsif name < mid_name
          upper = mid - 1
        elsif name > mid_name
          lower = mid + 1
        end
      end
      return nil
    end
  end
end
