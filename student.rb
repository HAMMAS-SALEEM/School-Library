require './person'

class Student < Person
  attr_accessor :classroom

  def initialize(age, classroom, name = 'Unknown')
    @classroom = classroom
    super(age, name)
  end

  def play_hookey
    "¯\(ツ)/¯"
  end
end
