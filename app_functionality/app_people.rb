require './classes/student'
require './classes/teacher'
require_relative 'ui_formating'

module AppPeople
  include UiFormat
  def person_condition(people, person, age, name)
    case person
    when '1'
      print 'Has parents permission [Y/N]: '
      permit = gets.chomp.downcase
      parent_permission = permit != 'n'
      people.push(Student.new(age, parent_permission, name))
    when '2'
      print 'Insert specialization: '
      specialization = gets.chomp
      teacher = Teacher.new(specialization, age, name)
      people.push(teacher)
    end
  end

  def create_person(people)
    puts '1 - Create Student  2 - Create Teacher'
    select_option
    person = gets.chomp
    print 'Insert age: '
    age = gets.chomp
    print 'Insert name: '
    name = gets.chomp
    person_condition(people, person, age, name)
    puts 'Person Created Successfully'
    back_to_menu
  end

  def list_people(people)
    puts 'No person available' if people.length.zero?
    people.each { |person| puts "[#{person.type}] Name: #{person.name} Age: #{person.age}" }
    back_to_menu
  end
end
