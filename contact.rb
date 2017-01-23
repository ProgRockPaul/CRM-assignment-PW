class Contact
    attr_accessor :first_name, :last_name, :email, :note
    attr_reader :id

  @@contacts = []
  @@id = 1

  def self.all
    @@contacts
  end

  def initialize(first_name, last_name, email, note)
    @id = @@id
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note

    @@id += 1
  end
  #
  def self.create(first_name, last_name, email, note)
    new_contact = self.new(first_name, last_name, email, note)
    @@contacts << new_contact
    new_contact
  end
  #

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find
    @@contacts.each do |contact|
      return contact if contact.id == id
  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update
    case attribute
       when "first_name"
         self.first_name = new_value
       when "last_name"
         self.last_name = new_value
       when "email"
         self.email = new_value
       when "note"
         self.note = new_value
    end
  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(first_name, last_name, email, note, id)
    @@contacts.each do |contact|
    return contact if attribute == :first_name && contact.first_name == value
    return contact if attribute == :last_name && contact.last_name == value
    return contact if attribute == :email && contact.email == value
    return contact if attribute == :note && contact.note == value
    end
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

  def delete(id)
      @@contacts.delete_if {|contact| id == contact.id}
  end
end
#
# paul = Contact.new('Paul', 'Walsh', 'twentytwentyk@live.com', 'Local Bard')
# john = Contact.new('John', 'Petrucci', 'bearucci@gmail.com', 'Local Bear')
