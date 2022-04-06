require "./decorator.rb"

class TrimmerDecorator < Decorator
    def initialize(person)
        @person = person
        super(person)
    end

    def correct_name
        @person.correct_name.slice(0,9)
    end
end