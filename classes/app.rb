require './app_functionality/app_books'
require './app_functionality/app_people'
require './app_functionality/app_rentals'

class App
  include AppBooks
  include AppPeople
  include AppRentals
end
