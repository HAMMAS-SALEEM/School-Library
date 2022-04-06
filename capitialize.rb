require './decorator'

class CapitalizeDecorator < Decorator
  def initialize(person)
    super(person)
    @person = nameable
  end

  def correct_name
    @person.correct_name.capitalize
  end
end

