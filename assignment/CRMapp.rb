class Contact
    attr_accessor :first_name, :last_name, :email, :note
    attr_reader :id

  @@contacts = []
  @@id = 1000

  def self.all
    @@contacts
  end

  def initialize(first_name, last_name, email, note)
    @id = @@id
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
  end
  #
  def self.create(first_name, last_name, email, note)
    new_contact = Contact.new(first_name, last_name, email, note)
    @@contacts << new_contact
    @@id += 1
  end
  #
  # # This method should accept an id as an argument
  # # and return the contact who has that id
  # def self.find
  #   puts "Enter Contact ID Number to find."
  #   gets @id
  #   return @id
  # end
  #
  # # This method should allow you to specify
  # # 1. which of the contact's attributes you want to update
  # # 2. the new value for that attribute
  # # and then make the appropriate change to the contact
  # def update
  #   puts "Enter Contact ID Number:  "
  #   gets @id[]
  #   puts "What attribute would you like to update"
  # end
  #
  # # This method should work similarly to the find method above
  # # but it should allow you to search for a contact using attributes other than id
  # # by specifying both the name of the attribute and the value
  # # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(first_name, last_name, email, note, id)

  end
  #
  # This method should delete all of the contacts
  def self.delete_all
    @@contacts = []
  end

  def full_name
    return "#{first_name}, #{last_name}"
  end
  #
  # # This method should delete the contact
  # # HINT: Check the Array class docs for built-in methods that might be useful here
  # def delete
  #
  # end

end

paul = Contact.new('Paul', 'Walsh', 'twentytwentyk@live.com', 'Local Bard')
john = Contact.new('John', 'Petrucci', 'bearucci@gmail.com', 'Local Bear')
