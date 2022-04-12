require './classes/student'
require './classes/teacher'
require_relative 'ui_formating'
require_relative 'data_processing'

module AppPeople
  include UiFormat
  include ProcessData
  def person_condition(person, age, name)
    people_data = fetch_data('people')
    case person
    when '1'
      print 'Has parents permission [Y/N]: '
      permit = gets.chomp.downcase
      parent_permission = permit != 'n'
      person = Student.new(age, parent_permission, name)
    when '2'
      print 'Insert specialization: '
      specialization = gets.chomp
      person = Teacher.new(specialization, age, name)
    end
    person = { id: person.id, name: person.name, age: person.age, class_name: person.type }
    people_data.push(person)
    update_data('people', people_data)
  end

  def create_person
    puts '1 - Create Student  2 - Create Teacher'
    select_option
    person = gets.chomp
    print 'Insert age: '
    age = gets.chomp
    print 'Insert name: '
    name = gets.chomp
    person_condition(person, age, name)
    puts 'Person Created Successfully'
    back_to_menu
  end

  def list_people
    people = fetch_data('people')
    puts 'No person available' if people.length.zero?
    people.each { |person| puts "[#{person['class_name']}] Name: #{person['name']} Age: #{person['age']}" }
    back_to_menu
  end
end
