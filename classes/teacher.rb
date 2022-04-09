require_relative './person'

class Teacher < Person
  def initialize(specialization, age, name, parent_permission: true)
    @specialization = specialization
    super(age, parent_permission, name)
  end

  def can_use_services?
    true
  end
end
