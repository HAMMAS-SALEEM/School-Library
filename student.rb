require "./person.rb"

class Student < Person
    def initialize(age , name = "Unknown", classroom)
        @classroom = classroom
        super(age, name, parent_permission: true)
    end
    def play_hookey
        "¯\(ツ)/¯"
    end
end