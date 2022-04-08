require_relative './classes/app'

def create_app
  app = APP.new
  app.console_entry_point
end

def main
  create_app
  input = gets.chomp
  "Getting #{input}"
end

main
