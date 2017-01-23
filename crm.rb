require_relative 'contact'

class CRM

  def initialize(name)
    @name = name
  end

  def main_menu
      while true
        print_main_menu
        user_selected = gets.to.i
        call_option(user_selected)
      end
  end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number: '
  end

  def call_option(user_selected)
    case user_selected
    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then delete_contact
    when 4 then display_all_contacts
    when 5 then search_by_attribute
    when 6 then exit
    end
  end

  def add_new_contact
  print 'Enter First Name: '
  first_name = gets.chomp

  print 'Enter Last Name: '
  last_name = gets.chomp

  print 'Enter Email Address: '
  email = gets.chomp

  print 'Enter a Note: '
  note = gets.chomp

  Contact.create(first_name, last_name, email, note)

  end

  def modify_existing_contact

    print "Enter ID of the contact you'd like to modify:"
    id = gets.chomp.to_s

    print "Would you like to change the first_name, last_name, email, or note."
    attribute = gets.chomp.to_s

    print "Enter your modifcation"
    new_value = gets.chomp.to_s

    modify_this_contact = Contact.find(id)

    modify_this_contact.update()
  end

  def delete_contact
    print 'Enter contact I.D only if CERTAIN you wish to delete'
    id = gets.chomp.to_i
    c = Contact.find(id)
    display_a_contact(c)

  end

  def display_all_contacts
    Contact.all
  end

  def search_by_attribute
    puts "Search using one of four attributes"
    puts "[1] First Name"
    puts "[2] Last Name"
    puts "[3] E-mail"
    puts "[4] Note"
    method = gets.to_i
    case method
    when 1 then
      print "What is the first name of the contact you'd like to find?"
      first_name = gets.chomp.to_s
      return Contact.find_by("first_name",first_name)
    when 2 then
      print "What is the last name of the contact you'd like to find?"
      last_name = gets.chomp.to_s
      return Contact.find_by("last_name",last_name)
    when 3 then
      print "What is the e-mail of the contact you'd like to find?"
      email = gets.chomp.to_s
      return Contact.find_by("email",email)
    when 4 then
      print "What is the note of the contact you'd like to find?"
      note = gets.chomp.to_s
      return Contact.find_by("note",note)
    else
      print "Sorry that is not a valid option."
      contact = []
    end

  end

end

a_crm_app = CRM.new
a_crm_app.main_menu
a_crm_app.print_main_menu
