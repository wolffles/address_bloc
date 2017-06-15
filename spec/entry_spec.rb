require_relative '../models/entry'
#1 is the standard first line of an RSpec test file. We are saying that the file is a spec file and that it tests Entry
RSpec.describe Entry do
  #2 we use describe to give our test structure. In this case, we're using it to communicate that the specs test the Entry attributes.
  let(:entry) {Entry.new('Ada Lovelace', '010.012.1815', 'some.email@lovelace.com')}
  describe "attributes" do
    #<!-- can make global or scope specific let(:entry) {Entry.new('Ada Lovelace', '010.012.1815', 'some.email@lovelace.com')} -->

    #3 we separate our individual tests using the it method. Each it represents a unique test.
    it "responds to name" do
      #4 each RSpec test ends with one or more expect method, which we use to declare the expectations for the test. If those expectations are met, our test passes, if they are not, it fails.
      expect(entry).to respond_to(:name)
    end

    it "reports its name" do
      expect(entry.name).to eq('Ada Lovelace')
    end

    it "responds to phone number" do
      expect(entry).to respond_to(:phone_number)
    end

    it "reports its phone_number" do
      expect(entry.phone_number).to eq('010.012.1815')
    end

    it "responds to email" do
      expect(entry).to respond_to(:email)
    end

    it "reports its email" do
       expect(entry.email).to eq('some.email@lovelace.com')
    end
  end
  describe "#{to_s}" do
    it "prints an entry as a string" do
      entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      expected_string = "Name: Ada Lovelace\nPhone Number: 010.012.1815\nEmail: augusta.king@lovelace.com"
      expect(entry.to_s).to eq(expected_string)
    end
  end
end
