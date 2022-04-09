require_relative './person'

class Student < Person
  attr_reader :classroom

  def initialize(age, parent_permission, name)
    @classroom = classroom
    @type = 'Student'.delete_prefix('"').delete_suffix('"')
    super(age, parent_permission, name)
  end
  attr_accessor :type

  def play_hookey
    "¯\(ツ)/¯"
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
