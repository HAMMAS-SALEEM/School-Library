require_relative './person'

class Teacher < Person
  def initialize(specialization, age, name, parent_permission: true)
    @specialization = specialization
    @type = 'Teacher'.delete_prefix('"').delete_suffix('"')
    super(age, parent_permission, name)
  end
  attr_accessor :type

  def can_use_services?
    true
  end
end
